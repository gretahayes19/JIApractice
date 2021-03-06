# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  question_id :integer          not null
#  text        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class AnswerChoice < ApplicationRecord
    validates :text, presence: true 
    
    belongs_to :question,
        primary_key: :id,
        foreign_key: :question_id, 
        class_name: :Question

    has_many :responses,
        class_name: :Response,
        primary_key: :id,
        foreign_key: :answer_choice_id
end
