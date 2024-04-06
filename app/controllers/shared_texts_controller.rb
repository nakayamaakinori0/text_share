class SharedTextsController < ApplicationController
  def index
    if params[:room_key].blank?
      room_key = SecureRandom.urlsafe_base64(10)
      redirect_to shared_texts_path(room_key: room_key)
    else
      @shared_texts = SharedText.where(room_key: params[:room_key])
      @qr_code_svg = generate_qr_code(request.url)
    end
  end

  def generate_qr_code(url)
    qrcode = RQRCode::QRCode.new(url)
    qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 3
    )
  end

  def create
    @shared_text = SharedText.new(shared_texts_params)
    if @shared_text.save
      redirect_to shared_texts_path(room_key: @shared_text.room_key), notice: 'Text was successfully shared.'
    else
      render :index
    end
  end


  private

  def shared_texts_params
    params.require(:shared_text).permit(:content, :room_key)
  end
end
