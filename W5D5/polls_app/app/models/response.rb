# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  respondent_id    :integer          not null
#  answer_choice_id :integer          not null
#
class Response < ApplicationRecord
    validate :not_duplicate_response, unless: -> { answer_choice.nil? }

    belongs_to :respondent,
        class_name: :User,
        primary_key: :id,
        foreign_key: :respondent_id

    belongs_to :answer_choice,
        class_name: :AnswerChoice,
        primary_key: :id,
        foreign_key: :answer_choice_id

    has_one :question,
        through: :answer_choice,
        source: :question

    def sibling_responses
        self.question.responses.where.not(id: self.id)
    end

    def respondent_already_answered?
        sibling_responses.exists?(respondent_id: self.respondent_id)
    end

    def not_duplicate_response
        if respondent_already_answered?
            errors[:respondent_id] << 'cannot vote twice for question'
        end
    end
end
