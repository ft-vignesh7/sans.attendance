<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>CampusTrack · Attendance</title>
<style>
:root{
  --bg:#f5f5f7;--card:rgba(255,255,255,.82);--card-solid:#fff;--fg:#1d1d1f;--mut:#6e6e73;
  --ac:#0071e3;--ac2:#e8f2ff;--ok:#1d9b55;--no:#e5484d;--late:#c97800;--ol:#0077a8;
  --bd:rgba(60,60,67,.16);--hair:rgba(60,60,67,.11);--g1:#0a84ff;--g2:#5e5ce6;
  --sh:0 18px 50px rgba(0,0,0,.07),0 2px 8px rgba(0,0,0,.04);--r:22px;
  color-scheme:light;
}
@media (prefers-color-scheme:dark){:root:not([data-theme="light"]){
  --bg:#000;--card:rgba(28,28,30,.82);--card-solid:#1c1c1e;--fg:#f5f5f7;--mut:#98989d;
  --ac:#2997ff;--ac2:rgba(41,151,255,.18);--ok:#30d158;--no:#ff453a;--late:#ff9f0a;--ol:#64d2ff;
  --bd:rgba(235,235,245,.18);--hair:rgba(235,235,245,.11);--sh:0 18px 50px rgba(0,0,0,.28);color-scheme:dark;
}}
:root[data-theme="dark"]{--bg:#000;--card:rgba(28,28,30,.82);--card-solid:#1c1c1e;--fg:#f5f5f7;--mut:#98989d;--ac:#2997ff;--ac2:rgba(41,151,255,.18);--ok:#30d158;--no:#ff453a;--late:#ff9f0a;--ol:#64d2ff;--bd:rgba(235,235,245,.18);--hair:rgba(235,235,245,.11);--sh:0 18px 50px rgba(0,0,0,.28);color-scheme:dark}
html{scroll-padding-top:env(safe-area-inset-top,0px);background:var(--bg)}
*{box-sizing:border-box}
body{margin:0;background:var(--bg);color:var(--fg);font-family:-apple-system,BlinkMacSystemFont,"SF Pro Display","SF Pro Text","Segoe UI",sans-serif;font-size:15px;letter-spacing:-.01em;min-height:100vh}
button,input,select,textarea{font:inherit}button{cursor:pointer;-webkit-tap-highlight-color:transparent}
.hero{position:relative;overflow:hidden;background:linear-gradient(135deg,#0a84ff 0%,#5856d6 54%,#af52de 100%);color:#fff;padding:18px 16px 76px;isolation:isolate}
.hero:before,.hero:after{content:"";position:absolute;border-radius:50%;filter:blur(2px);opacity:.23;z-index:-1;pointer-events:none}.hero:before{width:280px;height:280px;background:#fff;right:-80px;top:-180px}.hero:after{width:220px;height:220px;background:#5ac8fa;left:-120px;bottom:-170px}
.hd{max-width:980px;margin:0 auto;display:flex;align-items:center;justify-content:space-between;gap:12px;position:relative;z-index:1}
.logo{display:flex;align-items:center;gap:10px;font-weight:750;font-size:20px;letter-spacing:-.03em}.brand-mark{width:30px;height:30px;border:1px solid rgba(255,255,255,.36);background:rgba(255,255,255,.18);border-radius:9px;display:grid;place-items:center;font-size:11px;letter-spacing:-.05em;box-shadow:inset 0 1px 0 rgba(255,255,255,.3)}
.chip{background:rgba(255,255,255,.16);border:1px solid rgba(255,255,255,.2);backdrop-filter:blur(18px);-webkit-backdrop-filter:blur(18px);border-radius:999px;padding:7px 11px;font-size:12px;display:flex;gap:8px;align-items:center;box-shadow:0 4px 16px rgba(0,0,0,.08)}.chip button{background:none;border:0;color:#fff;font-size:12px;text-decoration:underline;padding:0;opacity:.9}.chip b{font-weight:600}
.wrap{max-width:980px;margin:-54px auto 0;padding:0 16px 112px;position:relative;z-index:2}.card{background:var(--card);border-radius:var(--r);padding:20px;margin-bottom:16px;box-shadow:var(--sh);border:1px solid rgba(255,255,255,.4);backdrop-filter:blur(22px);-webkit-backdrop-filter:blur(22px);animation:rise .5s cubic-bezier(.2,.8,.2,1) both;transition:transform .25s ease,box-shadow .25s ease}.card:hover{box-shadow:0 22px 60px rgba(0,0,0,.1)}
@keyframes rise{from{opacity:0;transform:translateY(14px) scale(.985)}to{opacity:1;transform:none}}@keyframes pop{0%{transform:scale(.94);opacity:0}70%{transform:scale(1.03)}100%{transform:scale(1);opacity:1}}
h2{font-size:18px;line-height:1.2;margin:0 0 14px;letter-spacing:-.025em}.sub{color:var(--mut);font-size:13px;line-height:1.45}.row{display:grid;grid-template-columns:repeat(auto-fit,minmax(150px,1fr));gap:12px}label.f{display:flex;flex-direction:column;font-size:12px;color:var(--mut);gap:7px;font-weight:600;letter-spacing:.01em}select,input,textarea{padding:12px 13px;border-radius:13px;border:1px solid var(--bd);background:rgba(120,120,128,.08);color:var(--fg);font-size:15px;font-family:inherit;width:100%;transition:border-color .2s,box-shadow .2s,background .2s;outline:none}select:hover,input:hover,textarea:hover{background:rgba(120,120,128,.12)}select:focus,input:focus,textarea:focus{border-color:var(--ac);box-shadow:0 0 0 4px color-mix(in srgb,var(--ac) 18%,transparent);background:var(--card-solid)}
.btn{background:var(--ac);color:#fff;border:0;border-radius:13px;padding:12px 20px;font-size:15px;font-weight:650;box-shadow:0 5px 14px color-mix(in srgb,var(--ac) 24%,transparent);transition:transform .18s ease,filter .18s ease,box-shadow .18s ease}.btn:hover{filter:brightness(1.06);box-shadow:0 8px 20px color-mix(in srgb,var(--ac) 30%,transparent)}.btn:active{transform:scale(.96)}.btn.g{background:var(--ac2);color:var(--ac);box-shadow:none}.btn.s{padding:8px 13px;font-size:13px}.btn.ok{background:var(--ok)}.btn.no{background:var(--no)}.btn:disabled{opacity:.45;cursor:default;transform:none;box-shadow:none}
.nav{position:fixed;left:50%;transform:translateX(-50%);bottom:14px;width:min(620px,calc(100% - 24px));background:color-mix(in srgb,var(--card-solid) 84%,transparent);border:1px solid var(--bd);border-radius:22px;display:flex;justify-content:center;gap:5px;padding:7px; padding-bottom:calc(7px + env(safe-area-inset-bottom,0px));z-index:5;box-shadow:0 15px 45px rgba(0,0,0,.16);backdrop-filter:blur(24px);-webkit-backdrop-filter:blur(24px)}.nav button{flex:1;max-width:220px;background:none;border:0;border-radius:16px;padding:7px 8px;color:var(--mut);font-size:11px;font-weight:650;position:relative;transition:background .2s,color .2s,transform .2s}.nav button b{display:block;font-size:18px;line-height:1.1;font-weight:500;margin-bottom:2px}.nav button:hover{color:var(--fg);background:rgba(120,120,128,.1)}.nav button:active{transform:scale(.94)}.nav .on{background:var(--ac2);color:var(--ac)}.bd{position:absolute;top:1px;right:20%;background:var(--no);color:#fff;border-radius:99px;font-size:10px;padding:2px 6px;box-shadow:0 2px 5px rgba(0,0,0,.15)}
.st{display:flex;align-items:center;gap:11px;padding:12px 0;border-bottom:1px solid var(--hair);transition:transform .18s ease}.st:last-child{border:0}.st:hover{transform:translateX(3px)}.av{width:40px;height:40px;border-radius:50%;display:grid;place-items:center;color:#fff;font-weight:700;flex:none;box-shadow:inset 0 1px 0 rgba(255,255,255,.25)}.nm{flex:1;min-width:0;font-weight:600}.nm small{display:block;color:var(--mut);font-weight:400;font-size:12px;margin-top:2px}.seg{display:flex;gap:5px}.seg button{min-width:37px;padding:8px 8px;border-radius:10px;border:1px solid var(--bd);background:rgba(120,120,128,.08);color:var(--mut);font-size:12px;font-weight:750;transition:all .18s ease}.seg button:hover{transform:translateY(-2px);border-color:var(--ac);color:var(--ac)}.seg button:active{transform:scale(.88)}.seg .P.on{background:var(--ok);border-color:var(--ok);color:#fff}.seg .A.on{background:var(--no);border-color:var(--no);color:#fff}.seg .L.on{background:var(--late);border-color:var(--late);color:#fff}.seg .O.on{background:var(--ol);border-color:var(--ol);color:#fff}
.note{padding:12px 14px;border-radius:14px;font-size:13px;margin-bottom:14px;background:var(--ac2);border:1px solid color-mix(in srgb,var(--ac) 13%,transparent)}.note.w{background:color-mix(in srgb,var(--late) 14%,transparent);border-color:color-mix(in srgb,var(--late) 22%,transparent)}.note.e{background:color-mix(in srgb,var(--no) 14%,transparent);border-color:color-mix(in srgb,var(--no) 22%,transparent)}
.stats{display:grid;grid-template-columns:repeat(3,1fr);gap:12px;margin-bottom:16px}.stat{background:var(--card);border:1px solid var(--bd);border-radius:18px;padding:16px 8px;text-align:center;box-shadow:var(--sh);animation:pop .45s .08s both}.stat b{font-size:26px;line-height:1.1;display:block;letter-spacing:-.04em}.stat span{font-size:12px;color:var(--mut);display:block;margin-top:5px}.scroll{overflow-x:auto;border-radius:12px}table{border-collapse:collapse;width:100%;font-size:14px}th,td{padding:11px 9px;text-align:center;border-bottom:1px solid var(--hair);white-space:nowrap}th{font-size:11px;text-transform:uppercase;letter-spacing:.05em;color:var(--mut);font-weight:650}th:first-child,td:first-child{text-align:left}.c-ok{color:var(--ok);font-weight:700}.c-no{color:var(--no);font-weight:700}.c-na{color:var(--mut)}.pbar{height:7px;background:var(--bd);border-radius:6px;overflow:hidden;min-width:70px}.pbar i{display:block;height:100%;border-radius:6px;transition:width .8s cubic-bezier(.2,.8,.2,1)}.pill{display:inline-block;padding:5px 10px;border-radius:99px;font-size:11px;font-weight:700;letter-spacing:.01em}.pill.P,.pill.approved{background:color-mix(in srgb,var(--ok) 15%,transparent);color:var(--ok)}.pill.A,.pill.rejected{background:color-mix(in srgb,var(--no) 15%,transparent);color:var(--no)}.pill.L,.pill.pending{background:color-mix(in srgb,var(--late) 16%,transparent);color:var(--late)}.pill.O{background:color-mix(in srgb,var(--ol) 15%,transparent);color:var(--ol)}
.ring{width:124px;height:124px;border-radius:50%;display:grid;place-items:center;flex:none;box-shadow:inset 0 0 0 1px color-mix(in srgb,var(--fg) 8%,transparent),0 9px 24px rgba(0,0,0,.08);animation:pop .6s both}.ring div{width:96px;height:96px;border-radius:50%;background:var(--card-solid);display:grid;place-items:center;font-size:25px;font-weight:800;letter-spacing:-.05em}.top{display:flex;gap:20px;align-items:center;flex-wrap:wrap}.login{max-width:440px;margin:0 auto}.roles{display:grid;grid-template-columns:1fr 1fr;gap:9px;margin-bottom:16px}.roles button{padding:15px;border-radius:15px;border:1px solid var(--bd);background:rgba(120,120,128,.08);color:var(--fg);font-weight:700;font-size:14px;transition:all .2s ease}.roles button:hover{transform:translateY(-2px);border-color:var(--ac)}.roles .on{border-color:var(--ac);background:var(--ac2);color:var(--ac);box-shadow:0 0 0 3px color-mix(in srgb,var(--ac) 10%,transparent)}.cred{font-size:12px;color:var(--mut);background:rgba(120,120,128,.08);border-radius:13px;padding:11px;margin-top:14px;line-height:1.7}.cred a{color:var(--ac);cursor:pointer;text-decoration:none}.cred a:hover{text-decoration:underline}.toast{position:fixed;left:50%;transform:translateX(-50%);bottom:calc(90px + env(safe-area-inset-bottom,0px));background:var(--fg);color:var(--bg);padding:12px 18px;border-radius:999px;font-size:13px;font-weight:600;z-index:9;animation:toastIn .35s cubic-bezier(.2,.8,.2,1);box-shadow:0 10px 30px rgba(0,0,0,.18)}@keyframes toastIn{from{opacity:0;transform:translate(-50%,12px) scale(.94)}to{opacity:1;transform:translate(-50%,0) scale(1)}}.lv{padding:13px 0;border-bottom:1px solid var(--hair)}.lv:last-child{border:0}.lv .h{display:flex;justify-content:space-between;gap:8px;align-items:center;flex-wrap:wrap}
@media(max-width:560px){.hero{padding-top:14px}.chip{max-width:180px}.chip b{display:none}.wrap{padding-left:12px;padding-right:12px}.card{padding:16px;border-radius:19px}.st{align-items:flex-start}.seg{margin-left:auto}.seg button{min-width:34px;padding:8px 6px}.top{justify-content:center;text-align:center}.top>div:last-child{width:100%}.nav{bottom:9px}.stats{gap:8px}.stat{padding:14px 4px}}
@media(prefers-reduced-motion:reduce){*,*:before,*:after{animation-duration:.01ms!important;transition-duration:.01ms!important}}
</style>
</head>
<body>
<div class="hero"><div class="hd"><div class="logo"><span class="brand-mark">CT</span><span>CampusTrack</span></div><div id="who"></div></div></div>
<div class="wrap" id="app"></div>
<div class="nav" id="nav" style="display:none"></div>
<script>
var TCH={rao:{p:"teach@123",n:"Dr. Rao",c:["CSE2A"]},iyer:{p:"teach@456",n:"Prof. Iyer",c:["CSE2A","ECE2B"]},khan:{p:"teach@789",n:"Ms. Khan",c:["ECE2B"]}};
var CL={CSE2A:{n:"CSE-2A",s:[["21","Aarav"],["22","Divya"],["23","Farhan"],["24","Gayathri"],["25","Harish"],["26","Ishita"],["27","Karthik"],["28","Meera"]]},
ECE2B:{n:"ECE-2B",s:[["31","Nikhil"],["32","Priya"],["33","Rahul"],["34","Sneha"],["35","Tarun"],["36","Uma"]]}};
var STU={};Object.keys(CL).forEach(function(c){CL[c].s.forEach(function(s){STU[s[0]]={roll:s[0],name:s[1],cls:c}})});
var PER=[1,2,3,4,5,6],ST={P:"Present",A:"Absent",L:"Late",O:"On leave"};
function iso(d){return d.getFullYear()+"-"+String(d.getMonth()+1).padStart(2,"0")+"-"+String(d.getDate()).padStart(2,"0")}
function esc(s){return String(s).replace(/[&<>"]/g,function(c){return{"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;"}[c]})}
function $(i){return document.getElementById(i)}
function av(n){var h=0;for(var i=0;i<n.length;i++)h=(h*31+n.charCodeAt(i))%360;return'<div class="av" style="background:hsl('+h+',60%,50%)">'+esc(n[0])+"</div>"}
var S={role:"teacher",tab:"mark",cls:"CSE2A",date:iso(new Date()),period:1,cur:null,curKey:"",form:{from:iso(new Date()),to:iso(new Date()),reason:""}};
var U=null,ALL={},LV={},DC={},db=null,EDIT=null,pend=false;

/* ---------- data layer: shared live DB, or local demo memory ---------- */
function toast(m){var t=document.createElement("div");t.className="toast";t.textContent=m;document.body.appendChild(t);setTimeout(function(){t.remove()},2600)}
function snap(coll,setter){db.collection(coll).onSnapshot(function(s){var o={};s.docs.forEach(function(d){var v=d.data();v.id=d.id;o[d.id]=v});setter(o);softRender()},function(){db=null;render()})}
if(window.claude&&claude.use){
 claude.use("db").then(function(d){if(!d)return;db=d;snap("attendance",function(o){ALL=o});snap("leaves",function(o){LV=o});snap("decisions",function(o){DC=o});render()}).catch(function(){});
 claude.use("user").then(function(u){if(u){EDIT=u.canEdit();render()}}).catch(function(){});
}
function put(coll,id,data){
 if(db)return db.doc(coll+"/"+id).set(data);
 (coll==="attendance"?ALL:coll==="leaves"?LV:DC)[id]=Object.assign({id:id},data);render();return Promise.resolve();
}
function softRender(){var a=document.activeElement;if(a&&/INPUT|TEXTAREA|SELECT/.test(a.tagName)&&$("app").contains(a)){pend=true;return}render()}
document.addEventListener("focusout",function(){if(pend){pend=false;setTimeout(render,50)}});

/* ---------- helpers ---------- */
function lvStatus(l){return DC[l.id]?DC[l.id].status:"pending"}
function onLeave(roll,date){return Object.keys(LV).some(function(k){var l=LV[k];return l.roll===roll&&l.from<=date&&date<=l.to&&lvStatus(l)==="approved"})}
function key(){return S.cls+"_"+S.date+"_P"+S.period}
function loadCur(){var k=key();if(S.curKey===k&&S.cur)return;S.curKey=k;S.cur={};var r=ALL[k];
 CL[S.cls].s.forEach(function(s){S.cur[s[0]]=r&&r.records[s[0]]?r.records[s[0]]:(onLeave(s[0],S.date)?"O":"P")})}
function pct(roll){var p=0,a=0,o=0,cls=STU[roll].cls;Object.keys(ALL).forEach(function(k){var r=ALL[k];if(r.cls!==cls)return;var v=r.records[roll];if(!v)return;if(v==="A")a++;else if(v==="O")o++;else p++});
 var t=p+a;return{p:p,a:a,o:o,t:t,pc:t?Math.round(100*p/t):100}}
function opts(arr,sel){return arr.map(function(a){return'<option value="'+a[0]+'"'+(String(a[0])===String(sel)?" selected":"")+">"+esc(a[1])+"</option>"}).join("")}

/* ---------- login ---------- */
function loginView(){
 $("who").innerHTML="";$("nav").style.display="none";
 var t=S.role==="teacher";
 $("app").innerHTML='<div class="card login"><h2 style="text-align:center;font-size:20px">Welcome back</h2><div class="sub" style="text-align:center;margin-bottom:14px">Sign in to continue</div>'+
 '<div class="roles"><button class="'+(t?"on":"")+'" id="rT">👩‍🏫<br>Teacher</button><button class="'+(t?"":"on")+'" id="rS">🎓<br>Student</button></div>'+
 '<label class="f">'+(t?"Username":"Roll number")+'<input id="lu" autocomplete="off"></label><br><label class="f">Password<input id="lp" type="password"></label>'+
 '<div id="le" class="sub" style="color:var(--no);margin:8px 0;min-height:16px"></div><button class="btn" style="width:100%" id="go">Sign in</button>'+
 '<div class="cred"><b>Demo credentials</b> (tap to fill)<br>'+(t?Object.keys(TCH).map(function(k){return'<a data-u="'+k+'" data-p="'+TCH[k].p+'">'+k+" / "+TCH[k].p+"</a> · "+TCH[k].n}).join("<br>"):
 '<a data-u="21" data-p="stud@21">21 / stud@21</a> · Aarav<br><a data-u="32" data-p="stud@32">32 / stud@32</a> · Priya<br>Others: roll / stud@roll')+"</div></div>";
 $("rT").onclick=function(){S.role="teacher";loginView()};$("rS").onclick=function(){S.role="student";loginView()};
 document.querySelectorAll(".cred a").forEach(function(a){a.onclick=function(){$("lu").value=a.dataset.u;$("lp").value=a.dataset.p}});
 function go(){var u=$("lu").value.trim().toLowerCase(),p=$("lp").value;
  if(t&&TCH[u]&&TCH[u].p===p){U={role:"teacher",id:u,name:TCH[u].n,c:TCH[u].c};S.cls=U.c[0];S.tab="mark";S.cur=null}
  else if(!t&&STU[u]&&p==="stud@"+u){U={role:"student",id:u,name:STU[u].name,cls:STU[u].cls};S.tab="home"}
  else{$("le").textContent="Wrong username or password.";return}
  render()}
 $("go").onclick=go;$("lp").onkeydown=function(e){if(e.key==="Enter")go()};
}

/* ---------- shell ---------- */
function shell(){
 $("who").innerHTML='<div class="chip">'+(U.role==="teacher"?"":"")+esc(U.name)+' · <b>'+(U.role==="teacher"?"Editor":"Student")+'</b><button id="lo">Sign out</button></div>';
 $("lo").onclick=function(){U=null;render()};
 var pend=Object.keys(LV).filter(function(k){return lvStatus(LV[k])==="pending"&&(U.role==="teacher"?U.c.indexOf(STU[LV[k].roll].cls)>-1:false)}).length;
 var items=U.role==="teacher"?[["mark","✎","Mark"],["leave","⌁","Leaves"],["dash","◒","Dashboard"]]:[["home","⌂","My attendance"],["req","＋","Request leave"]];
 $("nav").style.display="flex";
 $("nav").innerHTML=items.map(function(i){return'<button class="'+(S.tab===i[0]?"on":"")+'" data-t="'+i[0]+'"><b>'+i[1]+"</b>"+i[2]+(i[0]==="leave"&&pend?'<span class="bd">'+pend+"</span>":"")+"</button>"}).join("");
 document.querySelectorAll(".nav button").forEach(function(b){b.onclick=function(){S.tab=b.dataset.t;render()}});
 return db?"":'<div class="note w">Demo mode: records stay on this page only. Open the published link while signed in to claude.ai for shared live data.</div>';
}

/* ---------- teacher: mark ---------- */
function markView(){
 loadCur();var c=CL[S.cls],ok=U.c.indexOf(S.cls)>-1,rec=ALL[key()];
 var h='<div class="card"><div class="row"><label class="f">Class<select id="sC">'+opts(U.c.map(function(k){return[k,CL[k].n]}),S.cls)+'</select></label>'+
 '<label class="f">Date<input type="date" id="sD" value="'+S.date+'"></label><label class="f">Period<select id="sP">'+opts(PER.map(function(p){return[p,"Period "+p]}),S.period)+"</select></label></div></div>";
 h+='<div class="card">';
 if(db&&EDIT===false)h+='<div class="note e">Your claude.ai account has view/contributor access only, so saving will be blocked. Ask the owner to share this page with you as an Editor.</div>';
 if(rec)h+='<div class="note w">Already submitted by '+esc(rec.by)+" at "+esc(rec.time)+". You can edit and update.</div>";
 h+="<h2>"+c.n+" · Period "+S.period+"</h2>";
 c.s.forEach(function(s){var v=S.cur[s[0]];
  h+='<div class="st">'+av(s[1])+'<div class="nm">'+s[1]+"<small>Roll "+s[0]+(onLeave(s[0],S.date)?" · approved leave":"")+'</small></div><div class="seg">'+
  ["P","A","L","O"].map(function(x){return'<button class="'+x+(v===x?" on":"")+'" data-id="'+s[0]+'" data-v="'+x+'" title="'+ST[x]+'">'+(x==="O"?"OL":x)+"</button>"}).join("")+"</div></div>"});
 var n={P:0,A:0,L:0,O:0};Object.keys(S.cur).forEach(function(k){n[S.cur[k]]++});
 h+='<div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:8px;margin-top:14px"><span class="sub">P '+n.P+" · A "+n.A+" · Late "+n.L+" · Leave "+n.O+'</span><span><button class="btn g s" id="allP">All present</button> <button class="btn" id="sub">'+(rec?"Update":"Submit")+"</button></span></div></div>";
 return h;
}
function markBind(){
 $("sC").onchange=function(e){S.cls=e.target.value;S.cur=null;render()};
 $("sD").onchange=function(e){if(e.target.value){S.date=e.target.value;S.cur=null;render()}};
 $("sP").onchange=function(e){S.period=+e.target.value;S.cur=null;render()};
 document.querySelectorAll(".seg button").forEach(function(b){b.onclick=function(){S.cur[b.dataset.id]=b.dataset.v;render()}});
 $("allP").onclick=function(){Object.keys(S.cur).forEach(function(k){S.cur[k]="P"});render()};
 $("sub").onclick=function(){var b=$("sub");b.disabled=true;b.textContent="Saving…";
  put("attendance",key(),{cls:S.cls,date:S.date,period:S.period,records:S.cur,by:U.name,time:new Date().toLocaleTimeString([],{hour:"2-digit",minute:"2-digit"}),ts:Date.now()})
  .then(function(){S.curKey="";S.cur=null;render();toast("✓ Attendance saved")}).catch(function(){render();toast("Not allowed: Editor access needed")})}
}

/* ---------- teacher: leave inbox ---------- */
function leaveInbox(){
 var list=Object.keys(LV).map(function(k){return LV[k]}).filter(function(l){return U.c.indexOf(STU[l.roll].cls)>-1}).sort(function(a,b){return b.ts-a.ts});
 var pn=list.filter(function(l){return lvStatus(l)==="pending"}),dn=list.filter(function(l){return lvStatus(l)!=="pending"});
 function card(l,act){var s=STU[l.roll];return'<div class="lv"><div class="h"><div style="display:flex;gap:10px;align-items:center">'+av(s.name)+"<div><b>"+s.name+'</b><div class="sub">'+CL[s.cls].n+" · Roll "+s.roll+'</div></div></div><span class="pill '+lvStatus(l)+'">'+lvStatus(l)+"</span></div>"+
  '<div style="margin:8px 0"><b>'+l.from+"</b> → <b>"+l.to+'</b><div class="sub">'+esc(l.reason)+"</div></div>"+
  (act?'<button class="btn ok s" data-d="approved" data-i="'+l.id+'">Approve</button> <button class="btn no s" data-d="rejected" data-i="'+l.id+'">Reject</button>':"")+"</div>"}
 return'<div class="card"><h2>Pending requests</h2>'+(pn.length?pn.map(function(l){return card(l,1)}).join(""):'<div class="sub">No pending requests 🎉</div>')+"</div>"+
 (dn.length?'<div class="card"><h2>Decided</h2>'+dn.map(function(l){return card(l,0)}).join("")+"</div>":"");
}
function leaveBind(){document.querySelectorAll("[data-d]").forEach(function(b){b.onclick=function(){
 put("decisions",b.dataset.i,{status:b.dataset.d,by:U.name,ts:Date.now()}).then(function(){toast("Leave "+b.dataset.d)}).catch(function(){toast("Not allowed: Editor access needed")})}})}

/* ---------- teacher: dashboard ---------- */
function dashView(){
 var t=Object.keys(ALL).map(function(k){return ALL[k]}).filter(function(r){return r.date===S.date}),ab=0;
 t.forEach(function(r){Object.keys(r.records).forEach(function(i){if(r.records[i]==="A")ab++})});
 var slots=Object.keys(CL).length*PER.length;
 var h='<div class="card"><label class="f" style="max-width:200px">Date<input type="date" id="dD" value="'+S.date+'"></label></div>'+
 '<div class="stats"><div class="stat"><b>'+t.length+"/"+slots+"</b><span>Periods marked</span></div><div class=\"stat\"><b>"+ab+"</b><span>Absences</span></div><div class=\"stat\"><b>"+(slots-t.length)+"</b><span>Not marked</span></div></div>";
 h+='<div class="card"><h2>Periods · '+S.date+'</h2><div class="scroll"><table><tr><th>Class</th>'+PER.map(function(p){return"<th>P"+p+"</th>"}).join("")+"</tr>";
 Object.keys(CL).forEach(function(c){h+="<tr><td>"+CL[c].n+"</td>"+PER.map(function(p){var r=ALL[c+"_"+S.date+"_P"+p];if(!r)return'<td class="c-na">–</td>';
  var a=Object.keys(r.records).filter(function(i){return r.records[i]==="A"}).length;return'<td class="'+(a?"c-no":"c-ok")+'">'+(a?a+" abs":"✓")+"</td>"}).join("")+"</tr>"});
 h+='</table></div></div><div class="card"><h2>Attendance % · all recorded periods</h2><div class="scroll"><table><tr><th>Student</th><th>Class</th><th>%</th><th></th></tr>';
 var any=0;Object.keys(STU).forEach(function(r){var s=STU[r],x=pct(r);if(!x.t)return;any=1;var low=x.pc<75;
  h+="<tr><td>"+s.name+"</td><td>"+CL[s.cls].n+'</td><td class="'+(low?"c-no":"c-ok")+'">'+x.pc+"%"+(low?" ⚠":"")+'</td><td><div class="pbar"><i style="width:'+x.pc+"%;background:var(--"+(low?"no":"ok")+')"></i></div></td></tr>'});
 if(!any)h+='<tr><td colspan="4" class="c-na">No attendance recorded yet.</td></tr>';
 return h+"</table></div></div>";
}
function dashBind(){$("dD").onchange=function(e){if(e.target.value){S.date=e.target.value;S.cur=null;render()}}}

/* ---------- student ---------- */
function homeView(){
 var s=STU[U.id],x=pct(U.id),low=x.pc<75,col=low?"var(--no)":"var(--ok)";
 var hist=[];Object.keys(ALL).forEach(function(k){var r=ALL[k];if(r.cls===s.cls&&r.records[U.id])hist.push({d:r.date,p:r.period,v:r.records[U.id]})});
 hist.sort(function(a,b){return a.d===b.d?b.p-a.p:(a.d<b.d?1:-1)});
 var h='<div class="card top"><div class="ring" style="background:conic-gradient('+col+" "+x.pc*3.6+'deg,var(--bd) 0)"><div>'+x.pc+'%</div></div><div><h2 style="margin:0">Hi '+esc(s.name)+'</h2><div class="sub">'+CL[s.cls].n+" · Roll "+s.roll+'</div>'+
 '<div style="margin-top:10px">'+(low?'<span class="pill A">⚠ Below 75%</span>':'<span class="pill P">On track</span>')+'</div></div></div>'+
 '<div class="stats"><div class="stat"><b class="c-ok">'+x.p+'</b><span>Present</span></div><div class="stat"><b class="c-no">'+x.a+'</b><span>Absent</span></div><div class="stat"><b style="color:var(--ol)">'+x.o+"</b><span>On leave</span></div></div>";
 h+='<div class="card"><h2>Recent periods</h2>'+(hist.length?hist.slice(0,12).map(function(i){return'<div class="st"><div class="nm">'+i.d+"<small>Period "+i.p+'</small></div><span class="pill '+i.v+'">'+ST[i.v]+"</span></div>"}).join(""):'<div class="sub">Nothing recorded yet.</div>')+"</div>";
 return h+'<div class="sub" style="text-align:center">View only. Attendance can be changed by teachers.</div>';
}
function reqView(){
 var mine=Object.keys(LV).map(function(k){return LV[k]}).filter(function(l){return l.roll===U.id}).sort(function(a,b){return b.ts-a.ts});
 return'<div class="card"><h2>Request leave</h2><div class="row"><label class="f">From<input type="date" id="lf" value="'+S.form.from+'"></label><label class="f">To<input type="date" id="lt" value="'+S.form.to+'"></label></div><br>'+
 '<label class="f">Reason<textarea id="lr" rows="3" placeholder="e.g. Medical appointment">'+esc(S.form.reason)+'</textarea></label><div id="le" class="sub" style="color:var(--no);min-height:16px;margin:6px 0"></div><button class="btn" id="ls" style="width:100%">Send request</button></div>'+
 '<div class="card"><h2>My requests</h2>'+(mine.length?mine.map(function(l){return'<div class="lv"><div class="h"><b>'+l.from+" → "+l.to+'</b><span class="pill '+lvStatus(l)+'">'+lvStatus(l)+'</span></div><div class="sub">'+esc(l.reason)+(DC[l.id]?" · by "+esc(DC[l.id].by):"")+"</div></div>"}).join(""):'<div class="sub">No requests yet.</div>')+"</div>";
}
function reqBind(){
 $("lf").oninput=function(e){S.form.from=e.target.value};$("lt").oninput=function(e){S.form.to=e.target.value};$("lr").oninput=function(e){S.form.reason=e.target.value};
 $("ls").onclick=function(){var f=S.form;
  if(!f.from||!f.to||f.to<f.from){$("le").textContent="Choose a valid date range.";return}
  if(f.reason.trim().length<3){$("le").textContent="Please add a reason.";return}
  var id="L"+Date.now().toString(36)+Math.random().toString(36).slice(2,5);
  $("ls").disabled=true;
  put("leaves",id,{roll:U.id,from:f.from,to:f.to,reason:f.reason.trim(),ts:Date.now()}).then(function(){S.form.reason="";render();toast("✓ Request sent")}).catch(function(){render();toast("Could not send. Try again.")})}
}

function render(){
 if(!U){loginView();return}
 var m=shell(),h="",bind=function(){};
 if(U.role==="teacher"){
  if(S.tab==="mark"){h=markView();bind=markBind}else if(S.tab==="leave"){h=leaveInbox();bind=leaveBind}else{h=dashView();bind=dashBind}
 }else{if(S.tab==="home")h=homeView();else{h=reqView();bind=reqBind}}
 $("app").innerHTML=m+h;bind();
}
render();
</script>
</body>
</html>
