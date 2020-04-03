require 'rails_helper'

RSpec.describe NewConnectionEvent do
  context 'a shu connected to server' do
    before(:all) do
      @new_connection_event = build(:new_connection_event)
    end

    describe '#driver_name' do
      specify { expect(@new_connection_event.driver_name).to eq('DEICIDE') }
    end

    describe '#driver_guid' do
      specify { expect(@new_connection_event.driver_guid).to eq('76561198389754793') }
    end

    describe '#car_index' do
      specify { expect(@new_connection_event.car_index).to eq(0) }
    end

    describe '#car_mode' do
      specify { expect(@new_connection_event.car_model).to eq('ks_toyota_gt86') }
    end

    describe '#car_skin' do
      specify { expect(@new_connection_event.car_skin).to eq('0_fusion_orange') }
    end

    describe 'after create' do
      before(:all) do
        @new_connection_event.save
        @driver = Driver.find_by(:guid => '76561198389754793')
        @car = Car.find_by(:model => 'ks_toyota_gt86')
      end

      it 'created a driver with GUID 76561198389754793' do
        expect(@driver).not_to be_nil
      end

      it 'created a acr with model ks_toyota_gt86' do
        expect(@car).not_to be_nil
      end

      it 'created ClientConnection record' do
        expect(ClientConnection.find_by(:car_id => @car.id, :driver_id => @driver.id)).not_to be_nil
      end

      context 'a shu connect to server the second times' do
        before(:all) do
          @second_time_new_connection_event = create(:new_connection_event)
        end

        it "won't create any new drivers" do
          expect(Driver.where(:guid => '76561198389754793').count).to eq(1)
        end

        it "won't create any new cars" do
          expect(Car.where(:model => 'ks_toyota_gt86').count).to eq(1)
        end
      end
    end

  end
end
