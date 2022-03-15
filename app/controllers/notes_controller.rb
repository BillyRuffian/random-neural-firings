class NotesController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!

  before_action :set_user
  before_action :set_note, except: [:index, :new, :create]

  def index
    @pagy, @notes = pagy(@user.notes)
  end

  def new
    @note = Note.new
    render 'notes/edit'
  end

  def create
    @note = @user.notes.create!(note_params)
    redirect_to @note
  end

  def update
    if @note.update(note_params)
      redirect_to @note
    end
  end

  def show
    render 'notes/show'
  end

  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_path, status: :see_other, notice: 'Note deleted' }
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
    # @user ||= User.find(params[:user_id])
    @user = current_user
  end

  def set_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
