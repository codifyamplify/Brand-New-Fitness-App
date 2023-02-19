class User < ActiveRecord::Base
    has_many :exercises
end

# On wizards_application_controller file
# Kandis
# class WizardsController < ApplicationController

# def spell_params
    # allowed_params = %w(spell_name spell_impact point_value wizard_id)
    # params.select{|k,v allowed_params.include?(k)}
# end