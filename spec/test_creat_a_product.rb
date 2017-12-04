RSpec.describe 'creat a new product', type: :feature do
  before do
    visit "https://myalinarails.herokuapp.com/"
  end
  context 'check login' do
    it 'should open the page' do
      expect(page).to have_content("Bike Berlin")
      find("a[href='/login']").click
      fill_in('user[email]', with: 'alina.ghetler@gmail.com')
      fill_in('user[password]', with: 'berlinberlin1')
      click_button('Log in')
      expect(page).to have_content("Products")
      click_link('Products')
      sleep(2)
      page.execute_script "window.scrollBy(0,1000)"
      sleep(2)
      find("a[href='/products/new']").click
      find('input[id="product_name"]').set('bici')
      find('textarea[id="product_description"]').set('description')
      find('input[id="product_image_url"]').set('https://www.google.de/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwiSgbfcivHXAhWJyKQKHfzHBYIQjRwIBw&url=https%3A%2F%2Fpixabay.com%2Fro%2Fbiciclet%25C4%2583-biciclete-ras%25C4%2583-c%25C4%2583l%25C4%2583torie-36999%2F&psig=AOvVaw1GDH1eLPs7CHtAo4moaIpk&ust=1512501880874659')
      find('input[id="product_colour"]').set('lila')
      find('input[id="product_price"]').set('200')
      find('input[type="submit"]').click
      expect(page).to have_content('Product was successfully created')
    end
  end
end