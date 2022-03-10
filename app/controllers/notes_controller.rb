class NotesController < ApplicationController
  before_action :set_user
  before_action :set_note, except: [:new, :create]

  def new
    @note = Note.new
    render 'notes/edit'
  end

  def create
    @user.notes.create!(note_params)
    redirect_to @user
  end

  def update
    if @note.update(note_params)
      redirect_to @user
    end
  end

  def show
    render 'notes/show'
  end

  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to @user, status: :see_other, notice: 'Note deleted' }
    end
  end

  # def edit
  #   respond_to do |format|
  #     format.turbo_stream
  #     # format.html
  #   end
  # end

  private

  def set_user
    @user ||= User.find(params[:user_id])
  end

  def set_note
    @note = set_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
