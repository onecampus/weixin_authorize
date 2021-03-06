# encoding: utf-8
module WeixinAuthorize
  module Api
    module Qrcode
    # http://mp.weixin.qq.com/wiki/index.php?title=生成带参数的二维码

      # 临时二维码
      def create_qr_scene(scene_id, expire_seconds=1800)
        post_url     = "#{qrcode_base_url}/create"
        qrcode_infos = {action_name: "QR_SCENE", expire_seconds: expire_seconds}
        qrcode_infos = qrcode_infos.merge(action_info(scene_id))
        http_post(post_url, qrcode_infos)
      end

      # 永久二维码
      def create_qr_limit_scene(scene_id)
        post_url     = "#{qrcode_base_url}/create"
        qrcode_infos = {action_name: "QR_LIMIT_SCENE"}
        qrcode_infos = qrcode_infos.merge(action_info(scene_id))
        http_post(post_url, qrcode_infos)
      end

      # 通过ticket换取二维码, 直接访问即可显示！
      def qr_code_url(ticket)
        WeixinAuthorize.mp_endpoint("/showqrcode?ticket=#{ticket}")
      end

      private

        def qrcode_base_url
          "/qrcode"
        end

        def action_info(scene_id)
          {action_info: {scene: {scene_id: scene_id}}}
        end

    end
  end
end
