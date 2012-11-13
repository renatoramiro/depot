require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["renato.ipj@gmail.com"], mail.from
    assert_match /Dear Dave Thomas/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["renato.ipj@gmail.com"], mail.from
    assert_match /<h3>Pragmatic Order Shipped<\/h3>/, mail.body.encoded
  end

end
