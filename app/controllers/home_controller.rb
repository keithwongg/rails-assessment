require 'json'
class HomeController < ApplicationController
  include HomeHelper

  def index
  end

  def destroy
    Hotel.destroy_all
    render :index
  end

  def data
    # Access the parameters sent in the form submission
    search_type = params[:search_type]

    # Your logic here
    if (search_type == 'hotel')
      hotel_ids = params[:hotel_ids].split(',').map{|x| x.strip}
      @label = 'destination'
      @hotels = Hotel.where(ref_id: hotel_ids)
    elsif (search_type == 'destination')
      destination_ids = params[:destination_ids].split(',').map{|x| x.strip}
      @label = 'destination'
      @hotels = Hotel.where(destination_id: destination_ids)
    end
    @data = Array.new
    @hotels.each do |h|
      booking_condition = h.booking_conditions.blank? ? [] : JSON.parse(h.booking_conditions.gsub('\"', '"'))
      location = h.location.blank? ? {} : {
          :lat => h.location.lat,
          :lng => h.location.long,
          :address => h.location.address,
          :city => h.location.country,
          :country => h.location.country,
        }
      images = h.hotel_images.blank? ? {} : {
          :rooms => h.hotel_images.where(category: 'rooms').map{|i| { :link => i.url, :description => i.caption }},
          :site => h.hotel_images.where(category: 'site').map{|i| { :link => i.url, :description => i.caption }},
          :amenities => h.hotel_images.where(category: 'amenities').map{|i| { :link => i.url, :description => i.caption }}
        }
        ameneties = h.facility.blank? ? {} : {
          :general => h.facility.where(category: 'general').map{|f| f.name },
          :room => h.facility.where(category: 'room').map{|f| f.name }
        }
      @data << {
        :id => h.ref_id,
        :destination_id => h.destination_id,
        :name => h.name,
        :location => location,
        :description => h.description,
        :amenities => ameneties,
        :images => images,
        :booking_conditions => booking_condition
      }
    end
    render :data
  end

  def paperFiles
    begin
      paperFilesUrl = 'https://5f2be0b4ffc88500167b85a0.mockapi.io/suppliers/paperflies'
      paperfiledata = getResponseBody(paperFilesUrl)
      paperfiledata.each do |data|
          paperFiles = PaperFiles.new(data)
          paperFiles.build_hotel_keys('hotel_id', 'destination_id', 'hotel_name', 'details')
          paperFiles.build_images_keys('link', 'caption', ['rooms', 'site'])
          paperFiles.create_or_update_data
      end
      @paperResp = "all good - paper"
      render :index
    rescue => e
      @paperResp = e
      render :index
    end
  end

  def patagonia
    begin
      patagoniaUrl = 'https://5f2be0b4ffc88500167b85a0.mockapi.io/suppliers/patagonia'
      patagoniaData = getResponseBody(patagoniaUrl)
      patagoniaData.each do |data|
        patagonia = Patagonia.new(data)
        patagonia.build_hotel_keys('id', 'destination', 'name', 'info')
        patagonia.build_images_keys('url', 'description', ['rooms', 'amenities'])
        patagonia.create_or_update_data
      end
      @pataResp = "all good - pataresp"
      render :index
    rescue => e
      @pataResp = e
      render :index
    end
  end

  def acme
    begin
      acmeUrl = 'https://5f2be0b4ffc88500167b85a0.mockapi.io/suppliers/acme'
      acmeData = getResponseBody(acmeUrl)
      acmeData.each do |data|
        acme = Acme.new(data)
        acme.build_hotel_keys('Id', 'DestinationId', 'Name', 'Description')
        acme.create_or_update_data
      end
      @acmeResp = "all good - acme"
      render :index
    rescue => e
      @acmeResp = e
      render :index
    end
  end

end
