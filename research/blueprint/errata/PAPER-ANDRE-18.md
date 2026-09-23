**André 2018: errata collation for ERRATA-PAPER-ANDRE-18**

Codex · codex-hjdg0j · 2026-09-23 · issue #1880.

This completes the requested collation of the earlier extraction and its passing notes. There are **17 unreviewed findings**: ten carried forward under their existing IDs, seven added here. E3 is preserved separately as a screened editorial concern. E14 concerns Güntzer’s cited paper and is already corrected by André. No independent-review verdict has been written. The earlier extraction is unchanged.

The most consequential findings are the false uniqueness claim for complete spectral norms and its finite-group parenthesis (E1), the unqualified injectivity assertion for rational-localization transitions (E16), and the inclusion wording in the introductory theorem for a possibly nonfaithful algebra (E13). E13 has a direct wording repair already reflected in Proposition 5.3.1(2). None of the counterexamples here refutes the central categorical form of the perfectoid Abhyankar lemma. Equally, this errata job does not certify every downstream application of a repaired assertion.

**Sources and extent of reading.** The full earlier JSON and all 516 lines of its report were read at commit 1a00cee3a524a91c8e699855875b082f38a295ed. This includes 199 items, three routes, 22 prerequisites, historical scope notes, and E1–E11. Their exact input hashes are in the JSON. Fresh reading concerns the passages implicated by those notes and the additional findings, not a second full-paper extraction.

| Source | PDF pages read | SHA-256 |
| --- | --- | --- |
| [published](https://www.numdam.org/item/10.1007/s10240-017-0096-x.pdf) | 2, 5, 11, 12, 13, 14, 22, 23, 24, 25, 26, 27, 28, 29, 30, 36, 41, 42, 43, 45, 47, 48, 50, 67, 68, 69, 70 | 087521436778eed56e5bac98f6f2b441bc2898eef35ebba9da1c1575bf00f96a |
| [arxiv-v1](https://arxiv.org/pdf/1609.00320v1) | 2, 12, 19, 20, 21, 22, 23, 24, 26, 27, 32, 36, 37, 38, 39, 61 | 485c564a47f04a62f8df5a8595fd1957870e511c59fd4959cdd9be0ef29a618e |
| [guntzer-74](https://www.numdam.org/item/10.24033/msmf.164.pdf) | 17, 18 | c81847caaf38dea6778e067d2d0389d3922e6528c9350fdd47da59e6220a939a |
| [conrad](https://virtualmath1.stanford.edu/~conrad/248APage/handouts/algclosurecomp.pdf) | 1, 2, 3 | 07052ff7a8c1a25ce876ca984f28d62e513998259906bd994d3dc1622cda3f5b |

All PDFs were downloaded on 2026-09-23. Journal page equals PDF page for André’s published paper and preprint. Güntzer has an archive cover: PDF pages 17–18 are printed 116–117. Printed-page images checked include André pp.2,22,26,27,29,30,41,42,43, the preprint pp.20,23,27,37, and Güntzer pp.116–117. Text extraction alone was not used to decide the disputed superscripts and signs.

**Search for existing corrections.** The [Springer article](https://link.springer.com/article/10.1007/s10240-017-0096-x) and [NUMDAM record](https://www.numdam.org/articles/10.1007/s10240-017-0096-x/) displayed no linked correction. Attempts to use the Springer journal’s correction-search pages failed with access/internal errors; title/DOI searches for erratum, correction and corrigendum found no relevant notice. The [arXiv history](https://arxiv.org/abs/1609.00320) lists only v1, dated 31 August 2016. The actual preprint was compared at each locator; it differs from the journal text. The [author page](https://webusers.imj-prg.fr/~yves.andre/) contains institutional/contact information and no correction or publication links. Thus “new” below means no correction located in this bounded search, not a claim of historical priority or an exhaustive journal-archive audit. No messages were sent to the author.

**Changes to the earlier reasoning.** E1 adds the missed use on published p.24 and an actual order-two counterexample to the parenthesis on p.22. The single automorphism of C_p in the old example has infinite order, so by itself it did not settle the finite-group case. Formula (2.11) determines an orbit maximum and cannot supply the proposed automatic-invariance repair. E6 uses power multiplicativity and submultiplicativity, rather than assuming multiplicativity of a spectral norm. E7’s printed relations yield the zero ring, a stronger failure than the old description. E10 distinguishes an occurrence corrected between versions from one still present in the published proof. E5 and E8 now give the literal reach of the slips even though their intended repairs are straightforward. E11 remains a harmless direct-citation repair. These qualifications supersede the earlier report’s blanket assertion that its repair audit was finished.

**E1 — Completeness alone does not determine the spectral norm.** Published §2.2.4 p.13; Lemme 2.4.1(2) p.22; Lemme 2.4.2 proof p.24; discussion after Théorème 3.4.1 p.41.

The short printed excerpt is recorded in the JSON. **Correction:** Keep uniqueness for a fixed topology. If both norms are complete, a continuous identity in one direction suffices by open mapping. Delete the automatic-invariance parenthesis in Lemme 2.4.1(2), or require continuity of the finite-group action; retain its explicit norm-invariance hypothesis. Reprove applications using their additional hypotheses.

Let F be the algebraic closure of Q_p inside C_p. It is dense and properly contained in C_p. Extend t from C_p minus F to a transcendence basis over F. The automorphism of the rational function field sending t to pt and fixing the other basis elements and F extends to an automorphism σ of its algebraic closure C_p. Thus ν(x)=|x| and ν′(x)=|σ(x)| are distinct complete multiplicative Q_p-algebra norms, with ν′(t)=p^(-1)ν(t). For a_n in F tending to t in ν, the same sequence tends to p^(-1)t in ν′. It is Cauchy for max(ν,ν′) but cannot have a limit for that norm. There is also an actual finite-group counterexample to the parenthesis of Lemme 2.4.1(2): put B=C_p×C_p with N(x,y)=max(ν(x),ν′(y)), let G=C_2 swap factors, and give A=B^G=diagonal C_p its induced norm max(ν,ν′). B is complete and spectral; A is uniform normed, exactly as allowed in §2.4.1, though incomplete. The swap takes (t,0), of norm ν(t), to (0,t), of norm p^(-1)ν(t). The proposed old repair from (2.11) is invalid: that formula determines max_γ N(γb), not N(b), and its proof of individual equality uses G-invariance. The prior extraction also missed the invocation on p.24. For a finite projective algebra over a complete A, its given complete Banach topology agrees with the canonical module topology: choose finite generators, use the continuous surjection A^n→B and open mapping. A-linear isomorphisms are then continuous, so fixed-topology uniqueness applies to p.24 and p.41. This does not repair the general parenthesis on p.22, where A need not be complete.

**Versions:** v1 §2.2.4 p.12, Lemme 2.4.1 p.20, Lemme 2.4.2 p.21 and discussion p.37 contain the same uses. The old assertion that all occurrences lie on pp.13,22,41 is incorrect.

**Reach and correction status:** error; affects a stated result. No published correction located in the search above; independent review pending.

Brian Conrad, Completion of algebraic closure, §1 and Theorem 1.1, https://virtualmath1.stanford.edu/~conrad/248APage/handouts/algclosurecomp.pdf. All 3 pages read; algebraic closedness proved there, noncompleteness of Q_p-bar stated there with a BGR reference. BGR itself was not read in this errata job.

For clarity, the counterexample uses the following complete product norm and its induced, incomplete fixed-ring norm:

$$N(x,y)=\max\{|x|,|\sigma(y)|\},\qquad N(a,a)=\max\{|a|,|\sigma(a)|\}.$$

The finite action is the ordinary transposition of the two factors. Its invariant algebra is uniform because the induced norm is power-multiplicative. The source requires only a uniform normed invariant algebra at this point; no completeness assumption on that algebra has been silently added. Requiring each group element to be continuous makes it isometric by fixed-topology uniqueness, and hence recovers the explicitly norm-preserving version of the lemma.

**E2 — Uniqueness cross-references point to the definition of uniformity.** Published Lemme 2.4.1(2) proof p.22 and after Théorème 3.4.1 p.41.

The short printed excerpt is recorded in the JSON. **Correction:** Replace both references by numbered paragraph 2.2.4; use the qualified norm statement of E1.

Paragraph 2.2.2 defines uniformity. The fixed-topology and completeness claims occur in paragraph 2.2.4. Changing the reference does not repair the false completeness claim.

**Versions:** Same incorrect number in v1 pp.20 and 37.

**Reach and correction status:** misprint; affects nothing. No published correction located in the search above; independent review pending.

**E4 — Sign of the 2-adic absolute-value exponent.** Published Exemple prophylactique 3.4.2 p.41, final norm equality.

The short printed excerpt is recorded in the JSON. **Correction:** The right hand side is 2^(3/2), with |2|=1/2.

With v(2)=1 and i²=−1, (1+i)²=2i gives v((1+i)/2)=−1/2. Since 2a₁(0)a₂(0) differs from (1+i)/2 by an integral element, v(a₁(0)a₂(0))=−3/2. This contradicts v(a₁(0))≥0 and v(a₂(0))≥−1. The printed absolute value does not. This repairs the displayed contradiction, not an independent reproof of every assertion in the example.

**Versions:** v1 p.37 has the same negative exponent, but its example uses n=2 and g=T₁+T₂ instead of the published n=1 and g=T+4; those examples are not identical.

**Reach and correction status:** misprint; affects the proof. No published correction located in the search above; independent review pending.

**E5 — Invert the pseudouniformizer in the root-saturation formula.** Published formula (2.17), paragraph 2.5.3(1), p.26.

The short printed excerpt is recorded in the JSON. **Correction:** Use [1/ϖ] in the middle expression.

The setting includes characteristic p, where inversion of p gives the zero ring. Already g=1 and B=K≠0 refute the printed equality. The surrounding discussion uses [1/ϖ], and B=B°[1/ϖ]. The intended formula is clear, but its literal printed version is a false stated equality.

**Versions:** v1 formula (2.18), p.23, has the same [1/p].

**Reach and correction status:** misprint; affects a stated result. No published correction located in the search above; independent review pending.

**E6 — Lower bound in the localization-injectivity proof.** Published Lemme 2.6.3 proof, p.29.

The short printed excerpt is recorded in the JSON. **Correction:** Replace 1 by |a|>0, under the stated assumptions a∈A° minus {0} and 0<|λ|≤|ga|.

For A=K⟨T⟩, g=T, a=ϖ and λ=ϖ, the infimum over m≥0 equals |ϖ|<1, attained at m=0. The image of the scalar ϖ in this nonzero K-algebra also necessarily has norm |ϖ|. For the correction one must not assume a spectral norm is multiplicative. Power multiplicativity and submultiplicativity instead give |ga|^m=|(ga)^m|≤|g^m a| |a|^(m−1) for m≥1. Hence |(g/λ)^m a|≥(|ga|/|λ|)^m |a|^(1−m)≥|a|. The m=0 term is |a|. Since ga≠0, a sufficiently small nonzero λ exists, proving the desired nonvanishing. The old extraction had the right bound but an invalid multiplicativity shortcut.

**Versions:** Same bound in v1 Lemme 2.6.3, p.26.

**Reach and correction status:** error; affects the proof. No published correction located in the search above; independent review pending.

**E7 — Complement index in the Boolean presentation.** Published paragraph 2.7.2 p.30, presentation of the uniform Banach algebra.

The short printed excerpt is recorded in the JSON. **Correction:** Use T_b+T_¬b−1, with the same index in each complement relation.

With the printed relations for all pairs (b,b′), subtracting two complement relations makes every T_b equal to x. The meet relations give x²=x and the complement relation gives 2x=1. Thus x=(2x)x=2x²=2x=1, then 2=1 and 1=0. The quotient is the zero ring, not an algebra with the prescribed nontrivial Boolean algebra. This strengthens and corrects the old reason, which said the idempotents merely collapse to {0,1}. Removing the prime restores the intended characteristic-function relations.

**Versions:** Same stray prime in v1 p.27.

**Reach and correction status:** misprint; affects a stated result. No published correction located in the search above; independent review pending.

**E8 — The test object for an arbitrary power-bounded element.** Published paragraph 2.7.1 p.30, first paragraph.

The short printed excerpt is recorded in the JSON. **Correction:** Replace the source by K⟨T⟩ and the assignment by T↦a_n; also replace the source of the proposed single morphism by K⟨T⟩.

Unital K-algebra maps K→A send 1 to 1. Paragraph 2.1.5 gives the needed Tate-algebra universal property. To make the product obstruction precise, if a product P of copies of a nonuniform A existed with bounded projections π_n, choose a_n∈A° with ||a_n||>n max(1,||π_n||). Universal mapping gives f:K⟨T⟩→P. For b=f(T), ||a_n||=||π_n(b)||≤||π_n|| ||b||, a contradiction for n>||b||. This avoids assuming all projection norms have a common bound.

**Versions:** Same K and 1↦a_n in v1 p.26.

**Reach and correction status:** misprint; affects the proof. No published correction located in the search above; independent review pending.

**E9 — Untilts are localizations of the untilted algebra.** Published paragraph 3.4.4(c), p.43, before the square.

The short printed excerpt is recorded in the JSON. **Correction:** The Aα are untilts (A♭_α)^♯ and rational localizations of A.

This part of the argument assumes characteristic zero. A nonzero Aα has characteristic zero, while a rational localization of A♭ has characteristic p. The displayed vertical functor ♯ confirms the direction. See E18 for a separate base-ring slip later in the same paragraph.

**Versions:** Both slips also occur in v1 p.38.

**Reach and correction status:** misprint; affects the proof. No published correction located in the search above; independent review pending.

**E10 — Missing power-bounded superscript in invariants.** Published Lemme 2.4.1(2), proof p.22.

The short printed excerpt is recorded in the JSON. **Correction:** Use (B°)^G=A∩B°=A°.

The preceding hypothesis is B^G=A, while the statement correctly concludes (B°)^G=A°. For the trivial action on B=A=K, the printed equation would assert K=K°. It is a slip in the proof, independent of E1.

**Versions:** v1 p.20 omits the superscript in both the statement and proof. The published statement corrects it, but the proof does not.

**Reach and correction status:** misprint; affects nothing. No published correction located in the search above; independent review pending.

**E11 — Direct hypothesis for root extraction.** Published Lemme 2.5.3 proof, implication (2)⇒(6), p.27.

The short printed excerpt is recorded in the JSON. **Correction:** Cite (2) for p-radicial closedness in B[1/g].

The root being tested is initially an element of B[1/g]; (1) is formulated in B°[1/g]. Condition (2) is the direct hypothesis. This is only a citation improvement: (1)⇒(2) has just been proved, and its denominator argument can supply the missing membership if desired. It is not a counterexample to the lemma.

**Versions:** Same reference in v1 Sorite 2.5.3 proof p.24.

**Reach and correction status:** misprint; affects nothing. No published correction located in the search above; independent review pending.

**E12 — Publication year of the Shimomoto reference.** Published bibliography [32], p.70; earlier extraction prerequisites and final report paragraph.

The short printed excerpt is recorded in the JSON. **Correction:** Journal of Pure and Applied Algebra 220(2) (2016), 621–632, DOI 10.1016/j.jpaa.2015.07.008.

The author’s institutional publication record gives volume 220(2), February 2016 and these pages. The extraction already noted this discrepancy in passing but mistakenly referred to its numbering finding E3. This is a bibliographic correction, with no change to a mathematical assertion.

**Versions:** v1 bibliography [31], p.61, also gives 220 (2014).

**Reach and correction status:** misprint; affects nothing. No published correction located in the search above; independent review pending.

Kazuma Shimomoto institutional publication record: https://strdb.s.isct.ac.jp/html/100003320_en.html; DOI publisher endpoint could not be read during this check.

The supporting primary record is [Shimomoto’s institutional publication list](https://strdb.s.isct.ac.jp/html/100003320_en.html). The publisher DOI endpoint was unavailable during this check; the journal metadata was not inferred from an aggregator.

**E13 — An arbitrary finite étale algebra need not contain the base.** Published Théorème 0.3.1(1), p.2; compare Proposition 5.3.1(2), p.68. Earlier report unit-test note on a nonfaithful projection.

The short printed excerpt is recorded in the JSON. **Correction:** State the maximal perfectoid A-algebra B inside B′, with continuous structure map A→B and containing the image of A. Alternatively add faithfulness of B′ over A[1/g] if an inclusion A↪B is required. Keep the explicit faithfulness assumption for the trace statement in part (3).

Take any nonzero perfectoid field K, A=K×K, g=1 with its compatible roots, and B′=K via first projection. The algebra B′ is finite étale over A (a direct factor), but the nonzero idempotent (0,1) maps to zero. No A-compatible inclusion A↪B⊂B′ exists. B=K does satisfy the version using a structure map. Proposition 5.3.1(2) already uses the correct A-algebra wording. Thus this finding concerns the introductory containment/inclusion clause, not the ramified equivalence or the trace conclusion under its stated hypothesis.

**Versions:** Same inclusion wording in v1 Théorème 0.3.1(1), p.2.

**Reach and correction status:** error; affects a stated result. No published correction located in the search above; independent review pending.

**E14 — Reducedness in the cited Güntzer lemma (already corrected by André).** Güntzer (1974), Lemma 3.5 pp.116–117 (NUMDAM PDF pp.17–18). André published §3.2.2(2) p.36, footnote 16, explicitly records the correction.

The short printed excerpt is recorded in the JSON. **Correction:** Assume A reduced in Lemma 3.5, or add reducedness to (c). This is an error in the cited source, not an error by André.

For a complete perfect nonarchimedean field k of characteristic p, the dual-number Banach algebra A=k[ε]/(ε²), with its finite-dimensional maximum norm, has A^p=k, a closed subspace. Yet any power-multiplicative norm would satisfy ||ε||^p=||ε^p||=0, contradicting separation. Thus (c) alone cannot imply (a) or (b). In the printed proof on p.117 the functions ||f^(p^i)||^(1/p^i) are called norms; reducedness is necessary there. André supplies it explicitly.

**Versions:** The correction is already in André v1 §3.2.2(2), p.32 footnote 18, and remains in the published version.

**Reach and correction status:** error; affects a stated result. André, published §3.2.2(2), p.36 footnote 16, DOI 10.1007/s10240-017-0096-x; already in arXiv:1609.00320v1 p.32 footnote 18.

The original [Güntzer PDF](https://www.numdam.org/item/10.24033/msmf.164.pdf), including the proof of Lemma 3.5, was checked. André’s footnote is the published correction being credited, not a new discovery attributed to this worker.

**E15 — Specify the unit-ball functor in the free-object adjunction.** Published paragraphs 2.5.1 p.24 and 3.5.1 p.45 (the latter in characteristic p).

The short printed excerpt is recorded in the JSON. **Correction:** Specify A↦A° as the right adjoint. The asserted Tate-algebra formulas are not left adjoints to the underlying set of the whole algebra.

For one generator, continuous K-algebra maps K⟨T⟩→A correspond to A°, by paragraph 2.1.5. For A=K and 0<|ϖ|<1, the assignment T↦ϖ^(−1) cannot be continuous: T^n stays bounded while its images do not. Thus it does not represent arbitrary elements of A. In characteristic p, the analogous perfectoid free object represents A° because compatible p-power roots are unique. If the author intended the unit-ball functor, the mathematics is correct and only that unstated interpretation must be supplied. The earlier extraction retained the ambiguity.

**Versions:** Same unspecified functor in v1 pp.21 and 39.

**Reach and correction status:** gap; affects a stated result. No published correction located in the search above; independent review pending.

**E16 — Uniform rational-localization transition maps need not be injective.** Published paragraph 2.6.4(1), p.29, immediately after Lemme 2.6.3.

The short printed excerpt is recorded in the JSON. **Correction:** Remove the general injectivity assertion. Any later use needs hypotheses ensuring the particular restriction map is injective, or its own proof. Non-zero-divisibility of g alone is insufficient. If the sentence is intended only to continue the preceding isometric-multiplication case, state that restriction explicitly; the counterexample here does not address that restricted version.

Let A=K×K with the spectral maximum norm, choose 0<|ϖ|<1, and set g=(1,ϖ), λ=ϖ, μ=1. The element g is invertible, hence a non-zero-divisor. In the first localization λ/g=(ϖ,1) is already power-bounded, so A{λ/g}^u=A. In the second localization, the first factor is K, while the second factor is K⟨U⟩/(ϖU−1)=0 because 1−ϖU has the convergent geometric-series inverse. Thus A{μ/g}^u=K, and the transition is first projection, killing (0,1). Both localizations are uniform; choose K perfectoid with roots of ϖ if that extra restriction is desired. Density of A[1/g] in the source does not imply injectivity of restriction. The inverse-limit injectivity of Lemme 2.6.3 is a different assertion and is not refuted.

**Versions:** Same assertion in v1 paragraph 2.6.4(1), p.26.

**Reach and correction status:** error; affects a stated result. No published correction located in the search above; independent review pending.

**E17 — Dangling sentence in the almost-purity proof sketch.** Published paragraph 3.4.4, p.42, immediately before the characteristic-p case.

The short printed excerpt is recorded in the JSON. **Correction:** Delete the unfinished clause following the parenthetical discussion of circularity; alternatively restore a complete sentence about the Galois argument replacing Robba-ring methods.

The clause has no subject for the replacement and no object after usage. The complete explanation already appears above Proposition 3.4.2 and again in §3.4.5(1). This is an editorial remnant, not an additional missing mathematical argument.

**Versions:** Absent from the corresponding v1 paragraph 3.4.4 p.37: that text passes directly from the parenthesis to the characteristic-p case.

**Reach and correction status:** misprint; affects nothing. No published correction located in the search above; independent review pending.

**E18 — Completion at a point in the approximation square.** Published paragraph 3.4.4(c), p.43, parenthesis after the approximation references.

The short printed excerpt is recorded in the JSON. **Correction:** The completion in this pointwise construction is H(x)°, not the original global A°; interpret the colimit with the seminorm induced by x and separated completion.

The same paragraph constructs the completed residue field H(x) as the uniform colimit of the localizations Aα and uses it as the bottom-right corner of the square. Even for A=K×K and x the point on the first factor, a rational neighborhood isolates that factor, so this completion is K° rather than K°×K°. Correcting the symbol identifies the intended completion; this finding does not by itself establish the henselian or approximation claims cited in the sketch.

**Versions:** Same global A° in v1 p.38.

**Reach and correction status:** misprint; affects the proof. No published correction located in the search above; independent review pending.

**Screened notes retained for the reviewer.**

**PAPER-ANDRE-18/E3.** Not promoted to sourceIssues in this errata submission: the numbering convention is real (paragraph and Lemma 2.4.1 on p.22; paragraph 3.5.5 on p.47 and Lemma 3.5.5 on p.48), but independent counters are not intrinsically a misprint. No particular false theorem or irresolvable reference follows merely from the repeated numbers. Use qualified locators. The earlier global count of 44 was not recertified; the specific genuinely wrong references are E2 and E11. This is the errata worker’s assessment, not an independent-review verdict. The unchanged extraction retains the original record.

**roos-background.** The old prerequisite entry notes that Roos (2006) corrects earlier inverse-limit work. André §1.3 p.5 and bibliography [29] p.70 already cite the 2006 paper. The old report’s corrected DOI is a repair to repository metadata, not a demonstrated error in André. No specific false assertion of Roos (1961) was extracted, and its proof is not audited here. Preserve the correct 2006 supplier and do not manufacture an André erratum from this background note.

**root-localization-T-versus-g.** Old item 3.6.1-localization-perfectoid notes T versus g in Proposition 3.6.1 p.50. Its hypothesis identifies g=T·1, so these are the same element. Not an erratum.

E3’s original ID, proposed numbering change and explanation remain in screenedFindings, including the old unrecertified count of 44. That field is deliberately not an independent review. A reviewer of the earlier extraction can decide how its separate register entry should be handled. Open questions and missing library audits in the extraction are not converted into accusations against the source.

**Reproducible mathematical diagnostics.** The following Python 3 program checks the sign arithmetic, product-norm bound, Boolean presentation and componentwise localization. It is supplementary to the proofs above. It does not implement C_p, complete a Tate algebra, verify almost purity, or formalise any result.

~~~python
from fractions import Fraction as Q
from itertools import product
# E4: exact valuations; no floating-point sign comparison.
v_i_plus_1=Q(1,2)
v_rhs=v_i_plus_1-1
v_product=v_rhs-1
assert v_product==Q(-3,2) and v_product < -1
# E6: maximum spectral norm on a product, often NOT multiplicative.
count=0
for vg in [(0,0),(0,1),(1,2),(2,0)]:
 for va in product(range(4),repeat=2):
  vga=min(x+y for x,y in zip(vg,va))
  for vl in range(vga,vga+3):
   for m in range(11):
    vm=min(a+m*(g-vl) for a,g in zip(va,vg))
    assert vm<=min(va) # norm >= norm(a), since |ϖ|<1
    count+=1
assert min(Q(1,2)*2**m for m in range(11))==Q(1,2)<1 # Gauss example, m=0
# E7: all pairwise complement relations versus correct paired relations.
for p in [2,3,5,7]:
 wrong=[];correct=[]
 for t in product(range(p),repeat=2):
  meet=all((t[b]*t[c]-t[b&c])%p==0 for b,c in product(range(2),repeat=2))
  if meet and all((t[b]+t[1-c]-1)%p==0 for b,c in product(range(2),repeat=2)): wrong.append(t)
  if meet and all((t[b]+t[1-b]-1)%p==0 for b in range(2)): correct.append(t)
 assert wrong==[] and correct==[(0,1)]
# E16: scalar rational-domain criterion |g_i| >= |λ| in each field factor.
# Exact exponents for g=(1,ϖ); λ=ϖ and μ=1.
def surviving_factors(vg,vl): return [i for i,v in enumerate(vg) if v<=vl]
assert surviving_factors([0,1],1)==[0,1]
assert surviving_factors([0,1],0)==[0]
print(f'E4 exact valuation contradiction; E6 {count} product-norm cases; E7 four residue characteristics; E16 two-factor restriction: passed')
~~~

Observed output: E4 exact valuation contradiction; E6 2112 product-norm cases; E7 four residue characteristics; E16 two-factor restriction: passed.

**Repository checks.** Required commands:

~~~sh
python3 scripts/check_errata.py research/blueprint/errata/PAPER-ANDRE-18.json
python3 research/blueprint/intake.py check-files research/blueprint/errata/PAPER-ANDRE-18.json research/blueprint/errata/PAPER-ANDRE-18.md
git diff --check
~~~

No Lean file is required by this errata issue; no Lean compilation or formalisation is claimed. This deliverable supplies candidates and their evidence for the separate independent review.

---

**Independent review (`REV-ERRATA-PAPER-ANDRE-18`, issue #1881).** Claude Code, session `cc-fb70e5`, 23 September 2026. All 17 findings are **confirmed**; none is rejected, none is added, and no kind, locator, `printed`, `correction` or `affects` is changed. The per-finding verdicts are in the JSON beside this file; the reviewer's account of what was checked, with the sources and their hashes, is in `research/blueprint/reviews/REV-ERRATA-PAPER-ANDRE-18.md`.

Three entries gained something in review. **E6** is not only a false bound but a repairable one: `|(g/λ)^m a| ≥ |a|` follows from power-multiplicativity and submultiplicativity via `|ga|^m = |g^m a^m| ≤ |g^m a|·|a|^(m−1)` and `|a||λ| ≤ |λ| ≤ |ga|`, so Lemme 2.6.3 stands as stated. **E14** was checked at Güntzer's own statement, recovered from the OCR text layer of the NUMDAM scan: Lemma 3.5 p.116 asserts the equivalence of (a) the infimum formula being a norm inducing the same topology, (b) the existence of a power-multiplicative norm inducing it, and (c) `A^p` closed in `A`, with no reducedness hypothesis, and the printed equivalence is false — for `k = F_p((t))` and `A = k[ε]/(ε²)` with the max norm, `A^p = k^p` is closed, so (c) holds, while `|ε|² = |ε²| = 0` excludes any power-multiplicative norm. **E15** is confirmed but its reach is nil for a formaliser: the paragraph's mathematical claim has an independent direct proof immediately before it, and nothing later cites the adjunction, so the sentence can be dropped rather than repaired.

The reviewer also agrees that **E3** belongs in `screenedFindings` rather than among the findings, having met the two-counter convention twice while checking locators (paragraph 2.4.1 beside Lemme 2.4.1; paragraph 2.5.3 beside Lemme 2.5.3): it is a numbering convention that forces qualified locators, not a misprint, and the cross-references it actually breaks are E2 and E11, both recorded.
