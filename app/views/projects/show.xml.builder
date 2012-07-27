xml.instruct!
xml.project do
	xml.name @project.name
	xml.version @project.version
	@project.questions.each do |question|
		xml.questions do
			xml.name question.name
			xml.content question.content
			question.roqs.each do |roq|
				xml.options do
					xml.text roq.option.text
					xml.next_question roq.next.name
				end
			end
		end
	end
end