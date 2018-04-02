require 'selenium-webdriver'

class SeleniumDemoReg

  # page_url
  PAGE_URL = 'http://demoqa.com/registration/'
  # Page field
  FIRST_NAME_FIELD = 'name_3_firstname'
  LAST_NAME_FIELD = 'name_3_lastname'
  MARITAL_STATUS =  # id
  HOBBY_STATUS =  # values
  COUNTRY_DROP_DOWN_LIST =  'dropdown_7'
  DOB_MONTH_DROPDOWN_LIST = 'mm_date_8'
  DOB_DAY_DROPDOWN_LIST =  'dd_date_8'
  DOB_YEAR_DROPDOWN_LIST =  'yy_date_8'
  PHONE_NUMBER_FIELDS =  "phone_9"
  USERNAME_FIELD =  "username"
  EMAIL_FIELD =  "email_1"
  PROFILE_PICTURE_BUTTON =  # id
  DESCRIPTION_FIELD = "description"
  PASSWORD_FIELD = "password_2"
  CONFIRM_PASSWORD_FIELD = "confirm_password_password_2"
  SUBMIT_BUTTON = "pie_submit"
  REGISTRATION_CONFIRMATION = #class

  def initialize
    # set up driver
    @chrome_driver = Selenium::WebDriver.for :chrome
  end

  def access_registration_form
    @chrome_driver.get(PAGE_URL)
  end

  def current_url
    @chrome_driver.current_url
  end

  # first name field management - Difficulty Easy

  def set_first_name_field(first_name)
    @chrome_driver.find_element(:id, FIRST_NAME_FIELD).send_keys(first_name)
  end

  def get_first_name_field_value
    @chrome_driver.find_element(:id, FIRST_NAME_FIELD)['value']
  end

  def first_name_field_displayed
    @chrome_driver.find_element(:id, FIRST_NAME_FIELD).displayed?
  end

  # last name field management - Difficulty Easy

  def set_last_name_field(last_name)
    @chrome_driver.find_element(:id, LAST_NAME_FIELD).send_keys(last_name)
  end

  def get_last_name_field_value
    @chrome_driver.find_element(:id, LAST_NAME_FIELD)['value']
  end

  def last_name_field_displayed
    @chrome_driver.find_element(:id, LAST_NAME_FIELD).displayed?
  end

  # Marital option management - Difficulty Medium

  def select_marital_option(marital_status)
      # Consider something like a case statement and check the selenium selected? method
      case marital_status
      when 'single'
          @chrome_driver.find_element(:xpath, "//li[2]/div/div/input[1]").click
        when 'married'
          @chrome_driver.find_element(:xpath, "//li[2]/div/div/input[2]").click
        when 'divorced'
          @chrome_driver.find_element(:xpath, "//li[2]/div/div/input[3]").click
      end
   end

    def get_marital_option(marital_status)
      case marital_status
        when 'single'
          @chrome_driver.find_element(:xpath, "//li[2]/div/div/input[1]")["value"]
        when 'married'
          @chrome_driver.find_element(:xpath, "//li[2]/div/div/input[2]")["value"]
        when 'divorced'
          @chrome_driver.find_element(:xpath, "//li[2]/div/div/input[3]")["value"]
      end
    end

    def marital_option_displayed(marital_status)
      case marital_status
        when 'single'
          @chrome_driver.find_element(:xpath, "//li[2]/div/div/input[1]").displayed?
        when 'married'
          @chrome_driver.find_element(:xpath, "//li[2]/div/div/input[2]").displayed?
        when 'divorced'
          @chrome_driver.find_element(:xpath, "//li[2]/div/div/input[3]").displayed?
        end
    end

  # hobby option management - Difficulty Medium
    def select_hobby_option(hobby)
    # Consider something like a case statement and check the selenium selected? method //li[3]/div/div[1]/input[2]
    case hobby
        when "dance"
          @chrome_driver.find_element(:xpath,"//li[3]/div/div[1]/input[1]").click
        when "reading"
          @chrome_driver.find_element(:xpath,"//li[3]/div/div[1]/input[2]").click
        when "cricket "
          @chrome_driver.find_element(:xpath,"//li[3]/div/div[1]/input[3]").click
        end
    end

    def get_hobby_option(hobby)
      case hobby
        when 'dance'
          @chrome_driver.find_element(:xpath,"//li[3]/div/div[1]/input[1]")["value"]
        when 'reading'
          @chrome_driver.find_element(:xpath,"//li[3]/div/div[1]/input[2]")["value"]
        when 'cricket '
          @chrome_driver.find_element(:xpath,"//li[3]/div/div[1]/input[3]")["value"]
      end
    end

    def hobby_option_displayed(hobby)
      case hobby
        when 'dance'
          @chrome_driver.find_element(:xpath, "//li[3]/div/div[1]/input[1]").displayed?
        when 'reading'
          @chrome_driver.find_element(:xpath, "//li[3]/div/div[1]/input[2]").displayed?
        when 'cricket '
          @chrome_driver.find_element(:xpath, "//li[3]/div/div[1]/input[3]").displayed?
      end
    end


  # Select Country - Difficulty HARD

  # Look online how to handle option lists with Selenium in Ruby - you need to get used to solving problems
  # If you are spending too long see if anyone else has been successful
  # If no solution then a run through will happen once finished

  def get_selected_country
    @chrome_driver.find_element(:id, COUNTRY_DROP_DOWN_LIST)["value"]
  end

  def country_dropdown_list_select(country)
     select = @chrome_driver.find_element(:id, COUNTRY_DROP_DOWN_LIST)
     all_options = select.find_elements(:tag_name, "option")
     all_options.each do |option|
     if option["value"] == country
       option.click
     end
   end
  end

  # DOB management - Difficulty HARD

  # Look online how to handle option lists with Selenium in Ruby - you need to get used to solving problems
  # If you are spending too long see if anyone else has been successful
  # If no solution then a run through will happen once finished

  def dob_month_list_select(month_value)
      select = @chrome_driver.find_element(:id, DOB_MONTH_DROPDOWN_LIST)
      all_options = select.find_elements(:tag_name, "option")
      all_options.each do |option|
        if option["value"] == month_value
          option.click
        end
      end
  end

  def dob_day_list_select(day_value)
      select = @chrome_driver.find_element(:id, DOB_DAY_DROPDOWN_LIST)
      all_options = select.find_elements(:tag_name, "option")
      all_options.each do |option|
        if option["value"] == day_value
          option.click
        end
      end
  end

  def dob_year_list_select(year_value)
    select = @chrome_driver.find_element(:id, DOB_YEAR_DROPDOWN_LIST)
    all_options = select.find_elements(:tag_name, "option")
    all_options.each do |option|
      if option["value"] == year_value
        option.click
      end
    end
end

  # Phone number field management - Difficulty Easy

  def set_phone_number_field(phone_number)
    @chrome_driver.find_element(:id, PHONE_NUMBER_FIELDS).send_keys(phone_number)
  end

  def get_phone_number_field_value
    @chrome_driver.find_element(:id, PHONE_NUMBER_FIELDS)['value']
  end

  def phone_number_field_displayed
    @chrome_driver.find_element(:id, PHONE_NUMBER_FIELDS).displayed?
  end

  #  username field management - Difficulty Easy

  def set_user_name_field(user_name)
    @chrome_driver.find_element(:id, USERNAME_FIELD).send_keys(user_name)
  end

  def get_user_name_field_value
    @chrome_driver.find_element(:id, USERNAME_FIELD)['value']
  end

  def user_name_field_displayed
    @chrome_driver.find_element(:id, USERNAME_FIELD).displayed?
  end

  # Email field management - Difficulty Easy

  def set_email_field(email)
    @chrome_driver.find_element(:id, EMAIL_FIELD).send_keys(email)
  end

  def get_email_field_value
    @chrome_driver.find_element(:id, EMAIL_FIELD)["value"]
  end

  def email_field_displayed
    @chrome_driver.find_element(:id, EMAIL_FIELD).displayed?
  end


  # about yourself / description field - Difficulty Easy

  def set_about_yourself_field(details)
    @chrome_driver.find_element(:id, DESCRIPTION_FIELD).send_keys(details)
  end

  def get_about_yourself_value
    @chrome_driver.find_element(:id, DESCRIPTION_FIELD)["value"]
  end

  def about_yourself_displayed
    @chrome_driver.find_element(:id, DESCRIPTION_FIELD).displayed?
  end

  # Password management - Difficulty Easy

  def set_password_field(password)
    @chrome_driver.find_element(:id, PASSWORD_FIELD).send_keys(password)
  end

  def get_password_value
    @chrome_driver.find_element(:id, PASSWORD_FIELD)["value"]
  end

  def password_displayed
    @chrome_driver.find_element(:id, PASSWORD_FIELD).displayed?
  end

  def set_confirmation_password_field(password)
    @chrome_driver.find_element(:id, CONFIRM_PASSWORD_FIELD).send_keys(password)
  end

  def get_confirmation_password_value
    @chrome_driver.find_element(:id, CONFIRM_PASSWORD_FIELD)["value"]
  end

  def confirmation_password_displayed
    @chrome_driver.find_element(:id, CONFIRM_PASSWORD_FIELD).displayed?
  end

  # registration confirmation - Difficulty Easy

  def click_submit
    @chrome_driver.find_element(:name, SUBMIT_BUTTON).click
  end

  def check_registration_successful

  end
end

x = SeleniumDemoReg.new
x.access_registration_form
x.set_first_name_field('Christian')
x.set_last_name_field('Bryant')
x.select_marital_option('single')
x.select_hobby_option('cricket ')
x.country_dropdown_list_select('Afghanistan')
x.get_selected_country
x.dob_month_list_select("1")
x.dob_day_list_select("1")
x.dob_year_list_select("2001")
x.set_phone_number_field('077229302832')
x.set_user_name_field('test1')
x.set_email_field('cbryant@spartaglobal.com')
x.set_about_yourself_field('Hello my name is Christian')
x.set_password_field('6Y7H8YU!')
x.set_confirmation_password_field('6Y7H8YU!')




sleep 10
