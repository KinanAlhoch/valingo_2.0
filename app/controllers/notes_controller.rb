class NotesController < ApplicationController
  require 'firebase'

  def index
    @notes = current_user.notes
  end
  
  def create
    
    @host = request.host
    @note = Note.new(note_params)
    @note.user = current_user
    @note.save
    @notes = Note.where('chat_room_id = ? ', params[:note][:chat_room_id]).order('created_at desc')
    firebase = Firebase::Client.new("https://valingo.firebaseio.com/")
    firebase.push("#{@note.chat_room.id}", { :name => "#{current_user.name}", :text => "#{@note.note}", :id => "#{current_user.id}" })
    respond_to do |format|
      format.html do
	flash[:notice]= "Note Created!"
	redirect_to room_path(@note.room)
      end
      format.js do
	render :js => ""
      end
    end
  end
  
  def update

    @note = Note.find(params[:id])
    @note.update_attributes(note_params)
    respond_to do |format|

      format.html { redirect_to(@note, :notice => 'Note was successfully updated.') }
      format.json { head :ok }

    end
  end

  private
  def note_params
    params.require(:note).permit(:note, :chat_room_id)
  end
end
