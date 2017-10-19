def browser_factory(browser_name)
  case browser_name
  when 'Chrome'
    Watir::Browser.new :chrome, switches: %w[
      --headless
      --allow-running-insecure-content
      --disable-popup-blocking
      --disable-translate
      --ignore-certificate-errors
      --disable-gpu
    ]
  when 'Firefox'
    Watir::Browser.new :firefox
  when 'Safari'
    Watir::Browser.new :safari
  end
end

def replace_first_text(browser, selector, text)
  browser.execute_script("document.querySelector('#{selector}').innerHTML = '#{text}'")
end

def replace_all_texts(browser, selector, text)
  browser.execute_script("document.querySelectorAll('#{selector}').forEach(item => { item.innerHTML = '#{text}'})")
end
