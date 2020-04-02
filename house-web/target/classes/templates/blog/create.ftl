<!DOCTYPE html>

<html lang="en-US">
<@common.header/>

<body class="page-sub-page page-create-agency page-account" id="page-top">
<!-- Wrapper -->
<div class="wrapper">
    <!-- Navigation -->
     <@common.nav/>
     <!-- /.navigation -->
    <!-- end Navigation -->
    <!-- Page Content -->
    <div id="page-content">
        <!-- Breadcrumb -->
        <div class="container">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">新增帖子</li>
            </ol>
        </div>
        <!-- end Breadcrumb -->

        <div class="container">
            <header><h1>新增帖子</h1></header>
            <div class="row">
                <div class="col-md-8 col-sm-12 col-md-offset-2">
                    <form role="form" id="form-create-agency" method="post" action="/blog/submit">
                        <section>
                            <div class="form-group">
                                <label for="form-create-agency-title">标题:</label>
                                <input type="text" class="form-control" id="form-create-agency-title" name="title" required>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label for="form-create-agency-description">内容:</label>
                                <textarea class="form-control" id="form-create-agency-description" style="height: 700px"   name="content" rows="4" required></textarea>
                            </div><!-- /.form-group -->
                        </section>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <section id="address">
                                    <div class="form-group">
                                        <label for="form-create-agency-address-1">分类:</label>
                                        <select name="cat" >
                                            <option value="1" >准备买房</option>
                                            <option value="2" >看房/选房</option>
                                            <option value="3" >签约/定房</option>
                                            <option value="4" >全款/贷款</option>
                                            <option value="5" >缴税/过户</option>
                                            <option value="6" >入住/交接</option>
                                            <option value="7" >买房风险</option>
                                        </select>
                                    </div><!-- /.form-group -->
                                </section><!-- /#address -->
                            </div><!-- /.col-md-6 -->
                            <div class="col-md-6 col-sm-6">
                                <section id="contacts">
                                    <div class="form-group">
                                        <label for="form-create-agency-email">标签:</label>
                                        <input  class="form-control" name="tags" id="form-create-agency-email" required>
                                    </div><!-- /.form-group -->

                                </section><!-- /#address -->
                            </div><!-- /.col-md-6 -->
                        </div><!-- /.row -->

                            <#--<div class="col-md-6 col-sm-6">-->
                                <#--<div class="form-group">-->
                                    <#--<label for="submit-status">状态</label>-->
                                    <#--<select name="type" id="submit-status">-->
                                        <#--<option value="1">出售</option>-->
                                        <#--<option value="2">出租</option>-->
                                    <#--</select>-->
                                <#--</div><!-- /.form-group &ndash;&gt;-->
                            <#--</div>-->



                        <!-- /#select-package -->
                        <section id="submit">
                            <div class="form-group center">
                                <button type="submit" class="btn btn-default large" id="account-submit">创建经纪机构信息</button>
                            </div><!-- /.form-group -->
                        </section>
                    </form>
                    <hr>
                    <section class="center">
                        <figure class="note">By clicking the “Create Agency” button you agree with our <a href="terms-conditions.html">Terms and conditions</a></figure>
                    </section>
                </div><!-- /.col-md-8 -->
            </div><!-- /.row -->
        </div><!-- /.container -->
    </div>
    <!-- end Page Content -->
    <!-- Page Footer -->
   <@common.footer/>
    <!-- end Page Footer -->
</div>

<@common.js/>
<!--[if gt IE 8]>
<script type="text/javascript" src="assets/js/ie.js"></script>
<![endif]-->
 <script  type="text/javascript" >
     

     $(document).ready(function() {
          var errorMsg   = "${errorMsg!""}";
          var successMsg = "${successMsg!""}";
          if(errorMsg){ 
              errormsg("error",errorMsg);
          }
          if(successMsg) {
              successmsg("success",successMsg);
          }
        })
        
 </script>

</body>
</html>