package idmb.util;

import java.sql.Date;
import java.util.Map;

import idmb.model.BasketBean;
import idmb.model.FAQBean;
import idmb.model.MemberBean;
import idmb.model.NoticeBean;
import idmb.model.OrderBean;
import idmb.model.ProductBean;
import idmb.model.QNABean;
import idmb.model.ReviewBean;

public class MapToBean {
    
    public static MemberBean mapToMember(Map<String, Object> map) {
        MemberBean memberBean = new MemberBean();

        if (map.get("ID") != null)			{ memberBean.setId((String) map.get("ID")); }
        if (map.get("PASSWD") != null)		{ memberBean.setPasswd((String) map.get("PASSWD")); }
        if (map.get("NAME") != null)		{ memberBean.setName((String) map.get("NAME")); }
        if (map.get("PHONE") != null)		{ memberBean.setPhone((String) map.get("PHONE")); }
        if (map.get("BIRTH") != null)		{ memberBean.setBirth(Date.valueOf(((String) map.get("BIRTH")).replace("/", "-"))); }
        if (map.get("EMAIL") != null)		{ memberBean.setEmail((String) map.get("EMAIL")); }
        if (map.get("POSTCODE") != null)	{ memberBean.setPostcode((String) map.get("POSTCODE")); }
        if (map.get("ADDRESS1") != null)	{ memberBean.setAddress1((String) map.get("ADDRESS1")); }
        if (map.get("ADDRESS2") != null)	{ memberBean.setAddress2((String) map.get("ADDRESS2")); }
        if (map.get("RESERVE") != null)		{ memberBean.setReserve(Integer.parseInt(String.valueOf(map.get("RESERVE")))); }
        if (map.get("JOINDATE") != null)	{ memberBean.setJoindate(Date.valueOf(((String) map.get("JOINDATE")).replace("/", "-"))); }
        if (map.get("DELFLAG") != null)		{ memberBean.setDelflag((String) map.get("DELFLAG")); }
        
        return memberBean;
    }
    /*
    public static ProductBean mapToProduct(Map<String, Object> map) {
        ProductBean productBean = new ProductBean();

        productBean.setP_code(Integer.parseInt(String.valueOf(map.get("p_code"))));
        productBean.setP_name((String) map.get("p_name"));
        productBean.setP_image((String) map.get("p_image"));
        productBean.setP_price(Integer.parseInt(String.valueOf(map.get("p_price"))));
        productBean.setP_stock(Integer.parseInt(String.valueOf(map.get("p_stock"))));
        productBean.setP_sell(Integer.parseInt(String.valueOf(map.get("p_sell"))));
        productBean.setP_kind((String) map.get("p_kind"));
        productBean.setP_date((Date) map.get("p_date"));
        productBean.setP_detail((String) map.get("p_detail"));
        productBean.setP_zim(Integer.parseInt(String.valueOf(map.get("p_zim"))));
        productBean.setP_delflag((String) map.get("p_delflag"));
        
        return productBean;
    }

    public static OrderBean mapToOrder(Map<String, Object> map) {
        OrderBean orderBean = new OrderBean();

        orderBean.setO_num(Integer.parseInt(String.valueOf(map.get("o_num"))));
        orderBean.setO_id((String) map.get("o_id"));
        orderBean.setO_code(Integer.parseInt(String.valueOf(map.get("o_code"))));
        orderBean.setO_date((Date) map.get("o_date"));
        orderBean.setO_name((String) map.get("o_name"));
        orderBean.setO_count(Integer.parseInt(String.valueOf(map.get("o_count"))));
        orderBean.setO_price(Integer.parseInt(String.valueOf(map.get("o_price"))));
        orderBean.setO_total(Integer.parseInt(String.valueOf(map.get("o_total"))));
        orderBean.setO_postcode((String) map.get("o_postcode"));
        orderBean.setO_address1((String) map.get("o_address1"));
        orderBean.setO_address2((String) map.get("o_address2"));
        orderBean.setO_status((String) map.get("o_status"));
        orderBean.setO_delflag((String) map.get("o_delflag"));
        orderBean.setO_reciever((String) map.get("o_reciever"));

        return orderBean;
    }

    public static BasketBean mapToBasket(Map<String, Object> map) {
        BasketBean basketBean = new BasketBean();

        basketBean.setB_num(Integer.parseInt(String.valueOf(map.get("b_num"))));
        basketBean.setB_id((String) map.get("b_id"));
        basketBean.setB_code(Integer.parseInt(String.valueOf(map.get("b_code"))));
        basketBean.setB_name((String) map.get("b_name"));
        basketBean.setB_price(Integer.parseInt(String.valueOf(map.get("b_price"))));
        basketBean.setB_count(Integer.parseInt(String.valueOf(map.get("b_count"))));
        basketBean.setB_image((String) map.get("b_image"));
        basketBean.setB_kind((String) map.get("b_kind"));

        return basketBean;
    }

    public static ReviewBean mapToReview(Map<String, Object> map) {
        ReviewBean reviewBean = new ReviewBean();

        reviewBean.setR_num(Integer.parseInt(String.valueOf(map.get("r_num"))));
        reviewBean.setR_id((String) map.get("r_id"));
        reviewBean.setR_code(Integer.parseInt(String.valueOf(map.get("r_code"))));
        reviewBean.setR_date((Date) map.get("r_date"));
        reviewBean.setR_name((String) map.get("r_name"));
        reviewBean.setR_contents((String) map.get("r_contents"));
        reviewBean.setR_rate(Integer.parseInt(String.valueOf(map.get("r_rate"))));
        reviewBean.setR_recommend(Integer.parseInt(String.valueOf(map.get("r_recommend"))));
        reviewBean.setR_relevel(Integer.parseInt(String.valueOf(map.get("r_relevel"))));
        reviewBean.setR_groupnum(Integer.parseInt(String.valueOf(map.get("r_groupnum"))));
        
        return reviewBean;
    }

    public static QNABean mapToQna(Map<String, Object> map) {
        QNABean qnaBean = new QNABean();

        qnaBean.setQ_num(Integer.parseInt(String.valueOf(map.get("q_num"))));
        qnaBean.setQ_id((String) map.get("q_id"));
        qnaBean.setQ_code(Integer.parseInt(String.valueOf(map.get("q_code"))));
        qnaBean.setQ_category((String) map.get("q_category"));
        qnaBean.setQ_title((String) map.get("q_title"));
        qnaBean.setQ_contents((String) map.get("q_contents"));
        qnaBean.setQ_date((Date) map.get("q_date"));
        qnaBean.setQ_product((String) map.get("q_product"));
        qnaBean.setQ_status((String) map.get("q_status"));
        qnaBean.setQ_contentspw((String) map.get("q_contentspw"));
        qnaBean.setQ_relevel(Integer.parseInt(String.valueOf(map.get("q_relevel"))));
        qnaBean.setQ_groupnum(Integer.parseInt(String.valueOf(map.get("q_groupnum"))));

        return qnaBean;
    }

    public static NoticeBean mapToNotice(Map<String, Object> map) {
        NoticeBean noticeBean = new NoticeBean();

        noticeBean.setN_num(Integer.parseInt(String.valueOf(map.get("n_num"))));
        noticeBean.setN_title((String) map.get("n_title"));
        noticeBean.setN_contents((String) map.get("n_contents"));
        noticeBean.setN_date((Date) map.get("n_date"));
        noticeBean.setN_hit(Integer.parseInt(String.valueOf(map.get("n_hit"))));

        return noticeBean;
    }

    public static FAQBean mapToFaq(Map<String, Object> map) {
        FAQBean faqBean = new FAQBean();

        faqBean.setF_num(Integer.parseInt(String.valueOf(map.get("f_num"))));
        faqBean.setF_category((String) map.get("f_category"));
        faqBean.setF_title((String) map.get("f_title"));
        faqBean.setF_contents((String) map.get("f_contents"));

        return faqBean;
    }
    */
}
