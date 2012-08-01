xml.instruct!
xml.project do
	xml.name @project.name
	xml.version @project.version
	xml.start @project.start_question_name
	@project.questions.each do |question|
		xml.questions do
			xml.name question.name
			xml.content question.content
			xml.audio_url question.audio_url
			xml.picture_url question.picture_url
			xml.answer_type question.answer_type
			xml.set_reminder question.set_reminder
			question.roqs.each do |roq|
				xml.options do
					xml.text roq.option.text
					xml.next_question roq.next.name
					xml.value roq.value
				end
			end
		end
	end
end