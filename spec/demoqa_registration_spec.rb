require 'spec_helper'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration for page' do
      expect(@driver.current_url).to eq 'http://demoqa.com/registration/'
    end

    it 'should accept a first name' do
      if  @driver.first_name_field_displayed
          @driver.set_first_name_field('Christian')
          expect(@driver.get_first_name_field_value).to eq 'Christian'
      end

    end

    it 'should accept a last name' do
      if  @driver.last_name_field_displayed
          @driver.set_last_name_field('Bryant')
          expect(@driver.get_last_name_field_value).to eq 'Bryant'
      end
    end

    it 'should accept a marital status selection of Single, Married, or Divorced' do
      if  @driver.marital_option_displayed('single')
          @driver.select_marital_option('single')
          expect(@driver.get_marital_option('single')).to eq 'single'
      end

      if  @driver.marital_option_displayed('married')
          @driver.select_marital_option('married')
          expect(@driver.get_marital_option('married')).to eq 'married'
      end

      if  @driver.marital_option_displayed('divorced')
          @driver.select_marital_option('divorced')
          expect(@driver.get_marital_option('divorced')).to eq 'divorced'
      end
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
      if  @driver.hobby_option_displayed('dance')
          @driver.select_hobby_option('dance')
          expect(@driver.get_hobby_option('dance')).to eq 'dance'
      end

      if  @driver.hobby_option_displayed('reading')
          @driver.select_hobby_option('reading')
          expect(@driver.get_hobby_option('reading')).to eq 'reading'
      end

      if  @driver.hobby_option_displayed('cricket ')
          @driver.select_hobby_option('cricket ')
          expect(@driver.get_hobby_option('cricket ')).to eq 'cricket '
      end
    end

    it 'should have a country default of Afghanistan' do
        expect(@driver.get_selected_country).to eq 'Afghanistan'
    end

    it 'accept a new DOB' do
        @driver.dob_day_list_select('1')
        @driver.dob_month_list_select('1')
        @driver.dob_year_list_select('2000')
        expect(@driver.get_dob_day_list_value).to eq("1")
        expect(@driver.get_dob_month_list_value).to eq("1")
        expect(@driver.get_dob_year_list_value).to eq("2000")
    end

    it 'should accept a new country value' do

    end

    it 'should accept a valid phone number' do
      if  @driver.phone_number_field_displayed
          @driver.set_phone_number_field('077229302832')
          expect(@driver.get_phone_number_field_value).to eq '077229302832'
      end

    end

    it 'should accept a username' do
      if  @driver.user_name_field_displayed
          @driver.set_user_name_field('test1')
          expect(@driver.get_user_name_field_value).to eq 'test1'
      end
    end

    it 'should accept a about yourself text' do
      if  @driver.about_yourself_displayed
          @driver.set_about_yourself_field('Hello my name is Christian')
          expect(@driver.get_about_yourself_value).to eq 'Hello my name is Christian'
      end

    end

    it 'should accept a password' do
      if  @driver.password_displayed
          @driver.set_password_field('6Y7H8YU!')
          expect(@driver.get_password_value).to eq '6Y7H8YU!'
      end
    end

    it 'should accept a password confirmation' do
      if  @driver.confirmation_password_displayed
          @driver.set_confirmation_password_field('6Y7H8YU!')
          expect(@driver.get_confirmation_password_value).to eq '6Y7H8YU!'
      end
    end

  end

end
