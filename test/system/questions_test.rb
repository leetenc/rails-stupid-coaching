require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  test "visiting /ask renders the form" do
    visit ask_url
    assert_selector "h1", text: "Ask your coach anything"
  end

  test "saying Hello yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "Hello"
    click_on "Ask The Coach"

    assert_text "I don't care, get dressed and go to work!"
  end

  test "Ask a question ending with ? yields a Silly response from the coach" do
    visit ask_url
    fill_in "question", with: "Hello?"
    click_on "Ask The Coach"

    assert_text "Silly question, get dressed and go to work!"
  end

  test "Ask a question 'I am going to work' will yield a great response from the coach" do
    visit ask_url
    fill_in "question", with: "I am going to work"
    click_on "Ask The Coach"

    assert_text "Great!"
  end

  test "Ask a question and yield a poor response from the coach then click on ask new question" do
    visit ask_url
    fill_in "question", with: "I am NOT 123 going to work"
    click_on "Ask The Coach"

    take_screenshot

    click_on "Ask a new question"

    take_screenshot
    # assert_selector "h1", text: "Ask your coach anything"
    # assert_selector "input", text: "I am NOT 123 going to work"
    # assert_select '#askcoach' do
    #   assert_select "[value=?]", "I am NOT 123 going to work"
    # end

    # assert_select 'form input[type=text][value=I am NOT 123 going to work]'

    assert_text "I am NOT 123 going to work"

  end

end
