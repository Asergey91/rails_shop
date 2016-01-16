if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_NsbU85jBC53iXciXImntUasl',
    :secret_key => 'sk_test_SLCnfJWbGoE1m6P7yoUo6kM5'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]