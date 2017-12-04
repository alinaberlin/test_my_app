RSpec.describe 'login is working', type: :feature do
  before do
    visit "https://myalinarails.herokuapp.com/"
  end
  context 'check login' do
    it 'should open the page' do
      expect(page).to have_content("Bike Berlin")
      find("a[href='/login']").click
      fill_in('user[email]', with: 'alina.test@email.com')
      fill_in('user[password]', with: 'ParolaDeTest')
      click_button('Log in')
      expect(page).to have_content("Newest Bikes")
    end
  end
  context 'user by one product' do
    it 'should buy succesfull a product' do
      expect(page).to have_content("Bike Berlin")
      find("a[href='/login']").click
      fill_in('user[email]', with: 'alina.test@email.com')
      fill_in('user[password]', with: 'ParolaDeTest')
      click_button('Log in')
      expect(page).to have_content("Products")
      click_link('Products')
      click_link('BMW')
      sleep(1)
      find('button[class="stripe-button-el"]').click
      sleep(2.5)
      within_frame 'stripe_checkout_app' do
        find('input[autocomplete="cc-number"]').set('4111111111111111')
        find('input[placeholder="MM / YY"]').set('10/18')
        find('input[placeholder="CVC"]').set('458')
        find('input[placeholder="Email"]').set('alina.test@email.com')
        find('button[class="Button-animationWrapper-child--primary Button"]').click
      end
      sleep(5)
      expect(page).to have_content('You order details are')
    end
    it 'should ask for verification number' do
      expect(page).to have_content("Bike Berlin")
      find("a[href='/login']").click
      fill_in('user[email]', with: 'alina.test@email.com')
      fill_in('user[password]', with: 'ParolaDeTest')
      click_button('Log in')
      expect(page).to have_content("Products")
      click_link('Products')
      click_link('BMW')
      sleep(1)
      find('button[class="stripe-button-el"]').click
      sleep(2.5)
      within_frame 'stripe_checkout_app' do
        find('input[placeholder="Email"]').set('alina.ghetler@email.com')
        expect(page).to have_content('Enter the verification code')
      end
    end
  end   

end