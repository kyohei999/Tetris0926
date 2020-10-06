var FIELD_W = 600, FIELD_H = 600;	//ゲームの領域の範囲
var COLS = 10, ROWS = 20;	//操作の範囲
var BLOCK_W = 30;	//ブロックの幅
var BLOCK_H = 30;	//ブロックの高さ
var canvas = document.getElementById("field");
var ctx = canvas.getContext("2d");
var current_mino;
var current_x = 3, current_y = 0;	//ブロックが落ちる座標
var field = [];

let FIELD_X = 40;
let FIELD_Y = 40;

var delnum;
var score;

var BLOCK_CYA_COLOR = "cyan";		//シアン
var BLOCK_YEL_COLOR = "yellow";		//黄色
var BLOCK_GRE_COLOR = "green";		//緑
var BLOCK_RED_COLOR = "red";		//赤
var BLOCK_BLU_COLOR = "blue";		//青
var BLOCK_ORE_COLOR = "orange";		//オレンジ
var BLOCK_MAG_COLOR = "magenta";	//紫

var BLOCK_CYA_SCORE = 30;	//シアンブロックのスコア
var BLOCK_YEL_SCORE = 13;	//黄ブロックのスコア
var BLOCK_GRE_SCORE = 15;	//緑ブロックのスコア
var BLOCK_RED_SCORE = 15;	//赤ブロックのスコア
var BLOCK_BLU_SCORE = 20;	//青ブロックのスコア
var BLOCK_ORE_SCORE = 20;	//オレンジブロックのスコア
var BLOCK_MAG_SCORE = 25;	//紫ブロックのスコア

let NEXT_FIELD_X = FIELD_W - 200;
let NEXT_FIELD_Y = FIELD_Y;





let SCORE_PAIN_X	= NEXT_FIELD_X; // スコア表示領域の枠の左上座標（X）
let SCORE_PAIN_Y	= FIELD_H / 2; // スコア表示領域の枠の左上座標（Y）

score = 0; //スコア

for (var x = 1; x < FIELD_W - 1; x++) {

}

//スコア・操作説明などの描画
function drawScorePain() {
	ctx.fillStyle = "black";
	ctx.font = "bold 24px sans-serif";

	ctx.fillText("Score: " + score, SCORE_PAIN_X + 15, SCORE_PAIN_Y);

	/*
	for(var y = 0;y < 4;y++) {
		var col, str;
		switch(y) {
		case 0: col = BLOCK_CYA_COLOR; str = "(+3)   x "; break;
		case 1: col = BLOCK_YEL_COLOR; str = "(+5)   x "; break;
		case 2: col = BLOCK_GRE_COLOR; str = "(+10) x "; break;
		case 3: col = BLOCK_RED_COLOR; str = "(+13) x "; break;
		case 4: col = BLOCK_BLU_COLOR; str = "(+15)   x "; break;
		case 5: col = BLOCK_ORE_COLOR; str = "(+20) x "; break;
		case 6: col = BLOCK_MAG_COLOR; str = "(+25) x "; break;

		}
		ctx.fillStyle = col;
		ctx.fillRect(SCORE_PAIN_X + 15, SCORE_PAIN_Y + 30 * (y + 1), 25, 25);
		ctx.fillStyle = "rgba(230, 230, 230, 1.0)";
		ctx.font = "bold 16px sans-serif";
		ctx.fillText(str + delnum[y], SCORE_PAIN_X + 30 + 15, SCORE_PAIN_Y + 30 * (y + 1) + 18);
	}
	*/

	ctx.fillStyle = "black";
	ctx.font = "bold 18px sans-serif";
	//操作方法の表示
	ctx.fillText("←・→： 移動", SCORE_PAIN_X + 15, SCORE_PAIN_Y + 30 * 6);
	ctx.fillText("↑・：回転", SCORE_PAIN_X + 15, SCORE_PAIN_Y + 30 * 7);
	ctx.fillText("↓： 加速", SCORE_PAIN_X + 15, SCORE_PAIN_Y + 30 * 8);

	ctx.fillStyle = "black";
	ctx.fillRect(SCORE_PAIN_X, SCORE_PAIN_Y - 30, 1, 290);
	ctx.fillRect(SCORE_PAIN_X + 180, SCORE_PAIN_Y - 30, 1, 290);
	ctx.fillRect(SCORE_PAIN_X, SCORE_PAIN_Y - 30, 180, 1);
	ctx.fillRect(SCORE_PAIN_X, SCORE_PAIN_Y - 30 + 290, 180, 1);
}


//ゲームオーバーフラグ
let over = false;

let can = document.getElementById("canvas");
let con = canvas.getContext("2d");

canvas.width  = FIELD_W;
canvas.height = FIELD_H;
canvas.style.border = "4px solid #555";

tetro_t = Math.floor( Math.random()*(MINOS.length-1) )+1;
current_mino = MINOS[ tetro_t ];




for (var y = 0; y < ROWS; y++) {
  canvas[y] = [];
  for (var x = 0; x < COLS; x++) {
    canvas[y][x] = 0;
  }
}

current_mino = newMino();
render();
setInterval(tick, 650); //ブロックの落ちる速度	500ミリ秒
//drawScorePain(); // スコア表示領域を描画



function render() {
  ctx.clearRect(0, 0, FIELD_W, FIELD_H);	//画面クリア
  ctx.strokeStyle = "black";
  for (var y = 0; y < ROWS; y++) {
    for (var x = 0; x < COLS; x++) {
      drawBlock(x, y, canvas[y][x]);
    }
  }
  for (var y = 0; y < 4; y++) {
    for (var x = 0; x < 4; x++) {
      drawBlock(current_x + x, current_y + y, current_mino[y][x]);
    }
  }
  drawScorePain();
  if(over) {
	  console.log("ゲームオーバー");
	  let s="G A M E O V E R";
		con.font = "60px 'ＭＳ ゴシック'";
		let w = con.measureText(s).width;
		let x = FIELD_W/2 - w/2;
		let y = FIELD_H/2 - 20;
		con.lineWidth = 4;
		con.strokeText(s,x,y);
		con.fillStyle="red";
		con.fillText(s,x,y);
  }
}








function drawBlock(x, y, block) {
  if (block) {
    ctx.fillStyle = COLORS[block - 1];	//フィールドの枠の色
    ctx.fillRect(x * BLOCK_W, y * BLOCK_H, BLOCK_W - 1, BLOCK_H - 1);
    ctx.strokeRect(x * BLOCK_W, y * BLOCK_H, BLOCK_W - 1, BLOCK_H - 1);
  }
}


//ブロックの落下処理
function tick() {

	if(over)return;

  if (canMove(0, 1)) {
    current_y++;
  } else {
    fix();
    clearRows();
    current_mino = newMino();
    current_x = 3;
    current_y = 0;
	if( !canMove(0,0) )
	{
		over=true;
		//document.scoreForm.score.value = score;
	}
  }
  render();
}



//固定する
function fix() {
  for (var y = 0; y < 4; ++y) {
    for (var x = 0; x < 4; ++x) {
      if (current_mino[y][x]) {
        canvas[current_y + y][current_x  + x] = current_mino[y][x];
      }
    }
  }
}


//ブロックの衝突判定
function canMove(move_x, move_y, move_mino) {
  var next_x = current_x + move_x;
  var next_y = current_y + move_y;
  var next_mino = move_mino || current_mino;
  for (var y = 0; y < 4; y++) {
    for (var x = 0; x < 4; x++) {
      if (next_mino[y][x]) {
        if (next_y + y >= ROWS
              || next_x + x < 0
              || next_x + x >= COLS
              || canvas[next_y + y][next_x + x]) {
          return false;
        }
      }
    }
  }
  return true;
}


function clearRows() {
	  for (var y = ROWS - 1; y >=0; y--) { // 下からつまりyが大きいほうから判定していく
	    var fill = true; // 全て埋まっているか
	    for (var x = 0; x < COLS; x++) {
	      if (canvas[y][x] == 0) { // 0のブロックがあれば
	        fill = false; // fillではない
	        break;
	      }
	    }
	    if (fill) { // もしfillなら
		    for (var x = 0; x < COLS; x++) {
		    	switch(canvas[y][x]) {
			    	case 1: score += BLOCK_CYA_SCORE; break;	//シアン色の得点を追加
			    	case 2: score += BLOCK_YEL_SCORE; break;	//黄色の得点を追加
			    	case 3: score += BLOCK_GRE_SCORE; break;	//緑色の得点を追加
			    	case 4: score += BLOCK_RED_SCORE; break;	//赤色の得点を追加
			    	case 5: score += BLOCK_BLU_SCORE; break;	//青色の得点を追加
			    	case 6: score += BLOCK_ORE_SCORE; break;	//オレンジ色の得点を追加
			    	case 7: score += BLOCK_MAG_SCORE; break;	//紫色の得点を追加
		    	}
		    	console.log("score = "+score);
		    	document.scoreForm.score.value = score;

		    }


	      for (var v = y - 1; v >= 0; v--) { // その行より上を
	        for (var x = 0; x < COLS; x++) {
	          canvas[v + 1][x] = canvas[v][x]; // 一つ下にずらす
	        }
	      }
	      y++; // ずらしたら同じ行（上からずれた行）をもう一度判定する
	    }
	  }
		return score;
	}



//キーボードが押された時の処理
document.body.onkeydown = function(e) {

	if(over)return;

  switch (e.keyCode) {
    case 37:
      if (canMove(-1, 0)) {	//左
        current_x--;
      }
      break;
    case 39:
      if (canMove(1, 0)) {	//右
        current_x++;
      }
      break;
    case 40:
      if (canMove(0, 1)) {	//下
        current_y++;
      }
      break;
    case 38:				//上 回転
      rotated = rotate(current_mino);
      if (canMove(0, 0, rotated)) {
        current_mino = rotated;
      }
      break;
  }
  render();
}


//NEXTぶろっく








