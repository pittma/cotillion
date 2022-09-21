---
title: W-Types, and how?
---
<!--
<pre class="Agda"><a id="43" class="Symbol">{-#</a> <a id="47" class="Keyword">OPTIONS</a> <a id="55" class="Pragma">--without-K</a> <a id="67" class="Symbol">#-}</a>

<a id="72" class="Keyword">module</a> <a id="79" href="W.html" class="Module">W</a> <a id="81" class="Keyword">where</a>

<a id="88" class="Keyword">open</a> <a id="93" class="Keyword">import</a> <a id="100" href="Data.Unit.html" class="Module">Data.Unit</a>
<a id="110" class="Keyword">open</a> <a id="115" class="Keyword">import</a> <a id="122" href="Data.Empty.html" class="Module">Data.Empty</a>
</pre>-->

This is lifted from McBride's _W-types: good news and bad
news_[^1]. See the link in the footnote to follow along. Probably as I
make progress I'll updates here. But also maybe not.

<pre class="Agda"><a id="329" class="Keyword">data</a> <a id="Bool"></a><a id="334" href="W.html#334" class="Datatype">Bool</a> <a id="339" class="Symbol">:</a> <a id="341" href="Agda.Primitive.html#311" class="Primitive">Set</a> <a id="345" class="Keyword">where</a>
  <a id="Bool.true"></a><a id="353" href="W.html#353" class="InductiveConstructor">true</a> <a id="358" class="Symbol">:</a> <a id="360" href="W.html#334" class="Datatype">Bool</a>
  <a id="Bool.false"></a><a id="367" href="W.html#367" class="InductiveConstructor">false</a> <a id="373" class="Symbol">:</a> <a id="375" href="W.html#334" class="Datatype">Bool</a>

<a id="381" class="Keyword">data</a> <a id="W"></a><a id="386" href="W.html#386" class="Datatype">W</a> <a id="388" class="Symbol">(</a><a id="389" href="W.html#389" class="Bound">S</a> <a id="391" class="Symbol">:</a> <a id="393" href="Agda.Primitive.html#311" class="Primitive">Set</a><a id="396" class="Symbol">)</a> <a id="398" class="Symbol">(</a><a id="399" href="W.html#399" class="Bound">P</a> <a id="401" class="Symbol">:</a> <a id="403" href="W.html#389" class="Bound">S</a> <a id="405" class="Symbol">→</a> <a id="407" href="Agda.Primitive.html#311" class="Primitive">Set</a><a id="410" class="Symbol">)</a> <a id="412" class="Symbol">:</a> <a id="414" href="Agda.Primitive.html#311" class="Primitive">Set</a> <a id="418" class="Keyword">where</a>
  <a id="W._◂_"></a><a id="426" href="W.html#426" class="InductiveConstructor Operator">_◂_</a> <a id="430" class="Symbol">:</a> <a id="432" class="Symbol">(</a><a id="433" href="W.html#433" class="Bound">s</a> <a id="435" class="Symbol">:</a> <a id="437" href="W.html#389" class="Bound">S</a><a id="438" class="Symbol">)</a> <a id="440" class="Symbol">(</a><a id="441" href="W.html#441" class="Bound">f</a> <a id="443" class="Symbol">:</a> <a id="445" href="W.html#399" class="Bound">P</a> <a id="447" href="W.html#433" class="Bound">s</a> <a id="449" class="Symbol">→</a> <a id="451" href="W.html#386" class="Datatype">W</a> <a id="453" href="W.html#389" class="Bound">S</a> <a id="455" href="W.html#399" class="Bound">P</a><a id="456" class="Symbol">)</a> <a id="458" class="Symbol">→</a> <a id="460" href="W.html#386" class="Datatype">W</a> <a id="462" href="W.html#389" class="Bound">S</a> <a id="464" href="W.html#399" class="Bound">P</a>

<a id="natf"></a><a id="467" href="W.html#467" class="Function">natf</a> <a id="472" class="Symbol">:</a> <a id="474" href="W.html#334" class="Datatype">Bool</a> <a id="479" class="Symbol">→</a> <a id="481" href="Agda.Primitive.html#311" class="Primitive">Set</a>
<a id="485" href="W.html#467" class="Function">natf</a> <a id="490" href="W.html#353" class="InductiveConstructor">true</a> <a id="495" class="Symbol">=</a> <a id="497" href="Agda.Builtin.Unit.html#149" class="Record">⊤</a>
<a id="499" href="W.html#467" class="Function">natf</a> <a id="504" href="W.html#367" class="InductiveConstructor">false</a> <a id="510" class="Symbol">=</a> <a id="512" href="Data.Empty.html#886" class="Function">⊥</a>

<a id="ℕ"></a><a id="515" href="W.html#515" class="Function">ℕ</a> <a id="517" class="Symbol">:</a> <a id="519" href="Agda.Primitive.html#311" class="Primitive">Set</a>
<a id="523" href="W.html#515" class="Function">ℕ</a> <a id="525" class="Symbol">=</a> <a id="527" href="W.html#386" class="Datatype">W</a> <a id="529" href="W.html#334" class="Datatype">Bool</a> <a id="534" href="W.html#467" class="Function">natf</a>

<a id="zero"></a><a id="540" href="W.html#540" class="Function">zero</a> <a id="545" class="Symbol">:</a> <a id="547" href="W.html#515" class="Function">ℕ</a>
<a id="549" href="W.html#540" class="Function">zero</a> <a id="554" class="Symbol">=</a> <a id="556" href="W.html#367" class="InductiveConstructor">false</a> <a id="562" href="W.html#426" class="InductiveConstructor Operator">◂</a> <a id="564" class="Symbol">λ</a> <a id="566" class="Symbol">()</a> 

<a id="succ"></a><a id="571" href="W.html#571" class="Function">succ</a> <a id="576" class="Symbol">:</a> <a id="578" href="W.html#515" class="Function">ℕ</a> <a id="580" class="Symbol">→</a> <a id="582" href="W.html#515" class="Function">ℕ</a>
<a id="584" href="W.html#571" class="Function">succ</a> <a id="589" href="W.html#589" class="Bound">n</a> <a id="591" class="Symbol">=</a> <a id="593" href="W.html#353" class="InductiveConstructor">true</a> <a id="598" href="W.html#426" class="InductiveConstructor Operator">◂</a> <a id="600" class="Symbol">(λ</a> <a id="603" href="W.html#603" class="Bound">_</a> <a id="605" class="Symbol">→</a> <a id="607" href="W.html#589" class="Bound">n</a><a id="608" class="Symbol">)</a>
</pre>
[^1]: https://mazzo.li/epilogue/index.html%3Fp=324.html
