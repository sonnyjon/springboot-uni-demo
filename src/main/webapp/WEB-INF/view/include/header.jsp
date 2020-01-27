    <header style="padding-top: 10px; padding-bottom: 10px; background: #335379;">
        <div class="container">
            <div class="row">
                <div class="col-md-3 text-left">
                   <span class="align-middle" style="color:white"><h3>SJ University</h3></span>                    
                </div>
                <div class="col-md-6" align="right">
                    <a href="/" style="padding-right: 10px;"><span class="align-middle">Home</span></a>                    
                    <a href="/logout"><span class="align-middle">Logout</span></a>                    
                </div>
                <div class="col-md-3" style="color:white">
                    <span class="align-middle text-right"><b>User: </b><security:authentication property="principal.username" /></span>
                </div>
            </div>
        </div>
    </header>
