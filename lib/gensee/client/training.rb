module Gensee
  class Client
    # Gensee Training API
    # @see http://www.gensee.com/document-technical.php
    module Training
      # Create an Training classroom
      # @params: subject [String] *required*: classroom name/subject
      #          start_date [DateTime] *required*: Time which classroom will open.
      #          teacher_token [String/Integer] *required*: teacher passcode to login classroom(length: 6~15)
      #          assistant_token [String/Integer] *required*: assistant token to login classroom
      # @notice  subject is an unique field
      #          teacher_token and assistant_token should NOT be same value
      def create_classroom(subject, start_date, teacher_token, assistant_token, options = {})
        params = options.dup
        params[:subject] = subject
        params[:startDate] = time_to_ms(start_date)
        params.merge!(teacherToken: teacher_token.to_s, assistantToken: assistant_token.to_s)
        get preform_path('training/room/created'), params
      end

      # Modify Training classroom info
      # @params: id [String] *required*: classroom id
      def modify_classroom(id, subject, start_date, teacher_token, assistant_token, options = {})
        params = options.dup
        params[:id] = id
        params[:subject] = subject
        params[:startDate] = time_to_ms(start_date)
        params.merge!(teacherToken: teacher_token.to_s, assistantToken: assistant_token.to_s)
        get preform_path('training/room/modify'), params
      end

      def delete_classroom(room_id)
        get preform_path('training/room/deleted'), roomId: room_id
      end

      def classroom_info(room_id)
        get preform_path('training/room/info'), roomId: room_id
      end
    end
  end
end
