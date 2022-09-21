---
title: W-Types, and how?
---

<!--
<pre class="Agda"><a id="44" class="Symbol">{-#</a> <a id="48" class="Keyword">OPTIONS</a> <a id="56" class="Pragma">--without-K</a> <a id="68" class="Symbol">#-}</a>

<a id="73" class="Keyword">module</a> <a id="80" href="W.html" class="Module">W</a> <a id="82" class="Keyword">where</a>

<a id="89" class="Keyword">open</a> <a id="94" class="Keyword">import</a> <a id="101" href="Data.Unit.html" class="Module">Data.Unit</a>
<a id="111" class="Keyword">open</a> <a id="116" class="Keyword">import</a> <a id="123" href="Data.Empty.html" class="Module">Data.Empty</a>
</pre>-->

This is lifted from McBride's _W-types: good news and bad
news_[^1]. See the link in the footnote to follow along. Probably as I
make progress I'll updates here. But also maybe not.

<pre class="Agda"><a id="330" class="Keyword">data</a> <a id="Bool"></a><a id="335" href="W.html#335" class="Datatype">Bool</a> <a id="340" class="Symbol">:</a> <a id="342" href="Agda.Primitive.html#311" class="Primitive">Set</a> <a id="346" class="Keyword">where</a>
  <a id="Bool.true"></a><a id="354" href="W.html#354" class="InductiveConstructor">true</a> <a id="359" class="Symbol">:</a> <a id="361" href="W.html#335" class="Datatype">Bool</a>
  <a id="Bool.false"></a><a id="368" href="W.html#368" class="InductiveConstructor">false</a> <a id="374" class="Symbol">:</a> <a id="376" href="W.html#335" class="Datatype">Bool</a>

<a id="382" class="Keyword">data</a> <a id="W"></a><a id="387" href="W.html#387" class="Datatype">W</a> <a id="389" class="Symbol">(</a><a id="390" href="W.html#390" class="Bound">S</a> <a id="392" class="Symbol">:</a> <a id="394" href="Agda.Primitive.html#311" class="Primitive">Set</a><a id="397" class="Symbol">)</a> <a id="399" class="Symbol">(</a><a id="400" href="W.html#400" class="Bound">P</a> <a id="402" class="Symbol">:</a> <a id="404" href="W.html#390" class="Bound">S</a> <a id="406" class="Symbol">→</a> <a id="408" href="Agda.Primitive.html#311" class="Primitive">Set</a><a id="411" class="Symbol">)</a> <a id="413" class="Symbol">:</a> <a id="415" href="Agda.Primitive.html#311" class="Primitive">Set</a> <a id="419" class="Keyword">where</a>
  <a id="W._◂_"></a><a id="427" href="W.html#427" class="InductiveConstructor Operator">_◂_</a> <a id="431" class="Symbol">:</a> <a id="433" class="Symbol">(</a><a id="434" href="W.html#434" class="Bound">s</a> <a id="436" class="Symbol">:</a> <a id="438" href="W.html#390" class="Bound">S</a><a id="439" class="Symbol">)</a> <a id="441" class="Symbol">(</a><a id="442" href="W.html#442" class="Bound">f</a> <a id="444" class="Symbol">:</a> <a id="446" href="W.html#400" class="Bound">P</a> <a id="448" href="W.html#434" class="Bound">s</a> <a id="450" class="Symbol">→</a> <a id="452" href="W.html#387" class="Datatype">W</a> <a id="454" href="W.html#390" class="Bound">S</a> <a id="456" href="W.html#400" class="Bound">P</a><a id="457" class="Symbol">)</a> <a id="459" class="Symbol">→</a> <a id="461" href="W.html#387" class="Datatype">W</a> <a id="463" href="W.html#390" class="Bound">S</a> <a id="465" href="W.html#400" class="Bound">P</a>

<a id="natf"></a><a id="468" href="W.html#468" class="Function">natf</a> <a id="473" class="Symbol">:</a> <a id="475" href="W.html#335" class="Datatype">Bool</a> <a id="480" class="Symbol">→</a> <a id="482" href="Agda.Primitive.html#311" class="Primitive">Set</a>
<a id="486" href="W.html#468" class="Function">natf</a> <a id="491" href="W.html#354" class="InductiveConstructor">true</a> <a id="496" class="Symbol">=</a> <a id="498" href="Agda.Builtin.Unit.html#149" class="Record">⊤</a>
<a id="500" href="W.html#468" class="Function">natf</a> <a id="505" href="W.html#368" class="InductiveConstructor">false</a> <a id="511" class="Symbol">=</a> <a id="513" href="Data.Empty.html#886" class="Function">⊥</a>

<a id="ℕ"></a><a id="516" href="W.html#516" class="Function">ℕ</a> <a id="518" class="Symbol">:</a> <a id="520" href="Agda.Primitive.html#311" class="Primitive">Set</a>
<a id="524" href="W.html#516" class="Function">ℕ</a> <a id="526" class="Symbol">=</a> <a id="528" href="W.html#387" class="Datatype">W</a> <a id="530" href="W.html#335" class="Datatype">Bool</a> <a id="535" href="W.html#468" class="Function">natf</a>

<a id="zero"></a><a id="541" href="W.html#541" class="Function">zero</a> <a id="546" class="Symbol">:</a> <a id="548" href="W.html#516" class="Function">ℕ</a>
<a id="550" href="W.html#541" class="Function">zero</a> <a id="555" class="Symbol">=</a> <a id="557" href="W.html#368" class="InductiveConstructor">false</a> <a id="563" href="W.html#427" class="InductiveConstructor Operator">◂</a> <a id="565" class="Symbol">λ</a> <a id="567" class="Symbol">()</a> 

<a id="succ"></a><a id="572" href="W.html#572" class="Function">succ</a> <a id="577" class="Symbol">:</a> <a id="579" href="W.html#516" class="Function">ℕ</a> <a id="581" class="Symbol">→</a> <a id="583" href="W.html#516" class="Function">ℕ</a>
<a id="585" href="W.html#572" class="Function">succ</a> <a id="590" href="W.html#590" class="Bound">n</a> <a id="592" class="Symbol">=</a> <a id="594" href="W.html#354" class="InductiveConstructor">true</a> <a id="599" href="W.html#427" class="InductiveConstructor Operator">◂</a> <a id="601" class="Symbol">(λ</a> <a id="604" href="W.html#604" class="Bound">_</a> <a id="606" class="Symbol">→</a> <a id="608" href="W.html#590" class="Bound">n</a><a id="609" class="Symbol">)</a>
</pre>
[^1]: https://mazzo.li/epilogue/index.html%3Fp=324.html
