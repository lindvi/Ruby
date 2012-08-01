xml.instruct!
xml.project do
	xml.name @project.name
	xml.version @project.version
	@project.questions.each do |question|
		xml.questions do
			xml.id question.id
			xml.name question.name
			xml.content question.content
			xml.audio_url question.audio_url
			xml.picture_url question.picture_url
			xml.answer_type question.answer_type
			question.roqs.each do |roq|
				xml.options do
					xml.text roq.option.text
					xml.next_question_id roq.next_id
					xml.next_question roq.next.name
				end
			end
		end
	end
end