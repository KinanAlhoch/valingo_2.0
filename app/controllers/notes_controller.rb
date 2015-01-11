class NotesController < ApplicationController
  
  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.save

    respond_to do |format|

      format.html { redirect_to(@note, :notice => 'Note was successfully updated.') }
      format.json { head :ok }

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
