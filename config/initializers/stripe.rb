if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['pk_live_66t0GcecATTf4Ds7LyYPp2dk'],
    :secret_key => ENV['sk_live_ONqckJwXFjlyYWCpAfwY2P4A']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_OWkbQQxEgHKlyT0KOpgpRnfP',
    :secret_key => 'sk_test_6kLNjNMNfznHrDTTWMXiCxIQ'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]