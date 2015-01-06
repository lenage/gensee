module Gensee
  class Client
    # Gensee Training API
    # @see http://www.gensee.com/document-technical.php
    module Training
      ##-------------------- CLASSROOM --------------------##
      # Create an Training classroom
      # @params: subject [String] *required*: classroom name/subject
      #          start_date [DateTime] *required*: Time which classroom will open.
      #          teacher_token [String/Integer] *required*: teacher token to login classroom(length: 6~15)
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

      ##-------------------- COURSEWARE --------------------##

      # List all classrooms courseware
      def courseware_list(room_id)
        get preform_path('training/courseware/list'), roomId: room_id
      end

      def courseware_info(id)
        get preform_path('training/courseware/info'), coursewareId: id
      end

      # Modify courseware
      # @params id [String]: courseware ID
      def modify_courseware(id, subject, options = {})
        params= options.dup
        get preform_path('training/courseware/modify'), params.merge!(id: id, subject: subject)
      end

      def delete_courseware(id)
        get preform_path('training/courseware/deleted'), coursewareId: id
      end

      ##-------------------- TEACHER --------------------##

      # Register a teacher
      # @params login [String]: teacher login name(email/mobile) (length: 1~40)
      #         password [String]: teacher login password (length: 6~15)
      #         name [String]: teacher name, (length: 1-40)
      def create_teacher(name, login, password)
        params = { name: name, teacherLoginName: login, teacherPassword: password }
        get preform_path('training/teacher/created'), params
      end
    end
  end
end
