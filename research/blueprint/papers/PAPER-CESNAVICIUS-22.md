# Česnavičius (2022): extraction and routing

Issue [#1389](https://github.com/CBirkbeck/tauceti-explorer/issues/1389). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged checkpoint of Codex session codex-a71f92, whose material follows below.
- **The paper.** Kęstutis Česnavičius, *Grothendieck–Serre in the quasi-split unramified case*, Forum Math. Pi 10 (2022), e9. The version read is the author's PDF of 8 November 2022 (the text of arXiv v7), with the post-publication footnote on p. 20.
- **Items.** The result has **150 items: 8 library, 10 planned and 132 missing**. Every missing item is routed exactly once. One item is new (a repair, see E4) and one statement is corrected.
- **Mistakes.** Seven are recorded under `sourceIssues`. Three were already corrected in print: the author's p. 20 footnote (E1), Gille's 2005 erratum (E2) and Gille's 2026 errata (E3). Four are new (E4–E7), and E4 was also noticed by the author in a later survey.

## This continuation (cc-442dc5)

**What was read.** The author PDF was re-downloaded (same SHA-256) and read line by line, all 32 pages. This covered every proof, including the Bertini and weighted-projection arguments of §3, the Dedekind-base spreading of Variant 3.7, the curve and patching constructions of §§4–7, and §§8–9. The cited lemmas of Gille 2002 (p. 239, as a page image), Gille 2005 and Gille's 2026 errata were read at the steps CES22 uses. The author's survey *Problems about torsors over regular rings* (arXiv 2201.06424v4, 5 May 2025) was searched for post-publication corrections; arXiv and Crossref were searched for later versions of the paper.

**E4, the new gap.** Proposition 8.4 is stated for a semilocal ring R and a totally isotropic G. Claim (2) of its proof begins: "the isotropicity assumption implies that G has a proper parabolic subgroup P ⊂ G (see Definition 8.1)". Definition 8.1, however, asks for isotropy only over the local rings of R.

- **A counterexample to that step.** Take a one-dimensional Noetherian semilocal domain R with two closed points. Patch an Azumaya algebra A of degree 6 that is M₂(D) at one point and M₃(H) at the other, with D a cubic and H a quaternion division algebra, and split over Frac R. Then SL₁(A) is totally isotropic but has no proper parabolic over R, because the two closed fibres allow no common parabolic type. The details are in the finding.
- **The main theorem is unaffected.** Theorem 9.1 applies Proposition 8.4 to quasi-split G, which has a Borel over R.
- **The author's later fix.** In the survey's post-publication footnotes (p. 26), the author says that for semilocal rings the hypothesis should be strengthened, because total isotropy gives a parabolic "only after base change to each local ring". E4 therefore records that correction as `known`.
- **The repair recorded here keeps the printed hypothesis.** For each maximal ideal m, take a parabolic P_m over R_m and spread it out over R_g, where g is a nonzerodivisor lying in every other maximal ideal. Then lift unipotent points through coordinates divisible by a high power of g; the lifts are 1 at the other maximal ideals. This needs R Noetherian, and a limit argument reduces Proposition 8.4 to that case.
- **How the items change.** The lifting step is the new item local-parabolic-loop-lifts. The loop-coset item is restated for Noetherian R with parabolics over the local rings at the maximal ideals. The limit step is added to the proof steps of Proposition 8.4. Both are routed with the rest of §8 to ReductiveGroupsPartIIGrothendieckSerre, whose brief now says this.

**E1, checked independently.** The footnote's point is that Cohen's isomorphism ε_z ≅ Spec(k_z[u]/(u²)) need not be k_m-linear. There is a concrete case where no k_m-linear isomorphism exists: k_m = F_p(s) and z = V(t^p − s) on A¹. In O/I_z², the p-th powers lie in k_m^p[s + u], and none of them equals s.

**E5–E7.**
- E5 and E6 are misprints: k((t)) for k_m((t)) at the end of the proof of Proposition 8.4, and Out(G, B) for Aut(G, B) in the proof of Theorem 9.5.
- E7 is a false sentence that nothing depends on. The proof of Corollary 9.6 says that every inner form of SO_n is an SO(E). This fails for even n ≥ 4, for example SO(H ⊗ H′, γ ⊗ γ′) over Q. The argument, however, only twists by SO_n-torsors.

**The rest of the paper was checked** and no other mistake was found. This covered:
- the point count of Lemma 6.1;
- the primitive-element argument of Lemma 6.2;
- the flatness, closed-immersion and clopen-splitting steps of Lemma 6.3;
- the excision and central-extension induction of Lemma 7.2;
- the patching and hypersurface enlargement of Proposition 7.4;
- the vector-bundle and affine-quotient steps of Lemma 8.3;
- the twisting arguments of Theorems 9.3 and 9.5.

**Gaps.** All 26 checkpoint gaps now carry a status and a resolution.
- **Resolved (2):** the final coverage pass and the §6 commutative algebra.
- **Deferred (24):** these ask for the proofs of cited suppliers (CTS79, CTS87, GLL15, Gab01, SGA 3, EGA, Moret-Bailly, BČ21, Gille, Guo, Popescu, CT79, FP15/Pan20), or they are standing owner requests (relative Proj, P¹ base change, general Bruhat–Tits).
- **One observation.** If Proposition 8.4 is first reduced to Noetherian R, the non-Noetherian formal gluing (BČ21) is no longer needed, because Lemma 7.1 does the gluing.

**Why the status is now complete.**
- Every numbered statement and every cited input is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.
- What remains is the decomposition of cited suppliers' proofs, which is design work; those theorems are items, and their sources are listed.

## Result and scope

Let O be a Dedekind ring, allowing fields and finite products, and let R be a
regular semilocal flat O-algebra with geometrically regular O-fibers. For a
quasi-split reductive R-group G, Theorem 9.1 proves

    ker(H¹(R,G) → H¹(Frac(R),G)) = {*},

where Frac means the total ring of fractions. In the local case this gives
Theorem 1.2 for unramified regular local rings. It is a trivial-kernel theorem,
not a claim that every twist remains quasi-split or that every such H¹ map is
injective.

Theorem 9.3 says that any reductive G over the same R is split exactly when its
generic fiber is split. Corollary 1.3 gives the ordered factorization
G(Rhat[1/r]) = G(Rhat)·G(R[1/r]) for principal completion.

Theorem 9.5 has a different hypothesis: every R-form of G_ad must have H¹
injectivity. Under that hypothesis, generic quasi-splitness descends. The
equicharacteristic consequence imports the full Fedorov–Panin/Panin result;
Theorem 9.1 alone does not supply it. Conjectures 1.1 and 9.4 are not extracted as
proved results.

For Corollary 9.6, 2 must be invertible. The proof uses the orthogonal-torsor
interpretation and CT79's cancellation equivalence to reduce to hyperbolic
forms of even rank. It does not declare arbitrary SO inner forms quasi-split.
The two H¹ injectivities and the isometry-descent result are separate items.

## Versions and corrections

The main source is the [author's PDF of 8 November 2022](https://www.imo.universite-paris-saclay.fr/~kestutis.cesnavicius/split-unramified.pdf),
all 32 pages including proofs, footnotes and references.
Its SHA-256 is
984748e90f36730ddf4295176ca4b12e6aa7235c141461c0354e40320ef7476a.
Access date is 2026-09-22.

The published paper is Forum of Mathematics, Pi 10 (2022), e9, 1–30,
[DOI 10.1017/fmp.2022.5](https://doi.org/10.1017/fmp.2022.5).
The publisher's Lemma 6.3 statement/proof opening and Theorems 9.1, 9.3, 9.5
with proofs were compared. Numbering and relevant hypotheses agree; the
publisher lacks the later correction footnote. The remaining publisher pages
were not reread in full. The [arXiv v7 history](https://arxiv.org/abs/2009.05299v7)
explicitly records a postpublication footnote on p. 20. Its PDF is dated
November 9, despite the November 8 submission date. No exact byte/text identity
between the PDFs is asserted. All acquired PDF hashes and reading limits are
in supportingSources.

Three repairs matter to the dependency graph:

1. In Lemma 6.3, the coefficient-field identification of a first-order thickening
   need not be linear over an imperfect residue base field. The corrected
   argument uses CTHK97 Theorem 3.1.1 to embed each thickening in the affine line
   and separates their images by translations. An imperfect field is infinite.
   The perfect-field argument retains the coefficient-field construction.
2. [Gille's 2005 erratum](https://math.univ-lyon1.fr/~gille/publis/erratum05.pdf)
   repairs the parabolic-type step in Gil02 Lemma 3.12. The type must descend
   using the proper parabolic scheme and specialization at the normalized
   infinity fiber. The original lemma cannot be imported with its unrepaired proof.
3. [Gille's errata of 26 May 2026](https://math.univ-lyon1.fr/~gille/prenotes/errata.pdf)
   repair Gil09 Lemma 4.5. For M=Z_H(S)/S, special-fiber anisotropy is first
   transferred to the generic fiber, including its central torus, before Guo's
   integral-points theorem yields M(O)=M(K). The split-torus reference is
   Borel–Tits Corollary 6.8, replacing Proposition 6.11.

The corrected dependencies are explicit items, not comments that disappear
behind an unqualified citation.

## What was extracted

| Portion | Main coverage and guards |
| --- | --- |
| §§1–2 | Local theorem, completion factorization, quasi-pinnings, quasi-trivial Borel tori, and SC reduction with factorial strict henselizations |
| §3 | Avoidance; all three Bertini conclusions and successive degree control; weighted charts/blowups; seven field projection and seven Dedekind-base projection conclusions |
| §§4–5 | Curve fibration, torsor lifting, unipotent reduction, compatible quasi-pinning, finite étale equating, and constant-group curve torsor |
| §6 | Point-count cover, simple residue extensions, corrected thickening embedding, cartesian flat presentation, infinitesimal neighborhoods and monic polynomial |
| §7 | Torsor patching, support excision, the two distinct filtered-group claims, and affine-line reduction |
| §8 | Total isotropy, projective-line descent, corrected field/Whitehead inputs, residue loop cosets and affine-line triviality |
| §9 | Main semilocal theorem, ring examples, split descent, conditional/equicharacteristic quasi-split descent and three quadratic consequences |

Simultaneously constructed existential tuples, such as a curve with its section,
group and torsor, remain one existential item. Independently stated conclusions
are split. Some supporting-source projection and approximation arguments still
need finer declaration-sized decomposition; this is recorded rather than hidden.

Important conventions are retained. The paper's regular sequence allows a zero
terminal quotient, so the matching Mathlib notion is IsWeaklyRegular, not
IsRegular. Its quasi-split convention includes a quasi-pinning: a Borel, a
maximal torus, and the simple-root-line trivialization. Over a semilocal base
existence of a Borel is equivalent, but not over arbitrary bases. A smooth
curve's closed residue extension is simple, not necessarily separable.

Proposition 4.1 uses total codimension ≥ 2; Variant 3.7 uses fiberwise codimension.
The finite-field Bertini argument allows successively sufficiently large
degrees divisible by the characteristic exponent, not necessarily equal
degrees. Weighted blowups are not assumed to commute with nonflat base change.

Lemma 7.2(b)'s kernel statement concerns a smooth S-group with normal vector
filtration. Its surjectivity statement concerns a U-group with central vector
quotients. Proposition 8.4 requires total isotropy, semisimplicity, simple
connectivity, and a torsor trivial outside an R-finite closed locus. Its proof
lifts loop cosets; it does not assert surjectivity of the raw loop-group map.

## Library and ownership findings

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Actual statements were
read for the regular-local, weak-regular-sequence, absolute Proj, henselian,
sheaf-cohomology, reductive-field, simply-connected-field and Borel-field
imports. The source paths and declaration references are in libraryAudit
and baseline.

The field restrictions are material. Tau Ceti already has substantive
reductive, semisimple and Borel theory; it would be incorrect to call that
missing. Those predicates do not, merely by their existence, supply a
general-ring reductive group or the semilocal torsor theorems.

Reviewed SF.0/SF.1/SF.2/SF.4, R03.3 and LPV.3 audits were read. There is no
reviewed coverage entry for either reductive-group roadmap in the inspected
data, and none is fabricated. Exact layer text and pinned declarations were
used instead.

Upstream ReductiveGroups' Layer 8 already owns relative theory, classification,
central isogenies and the associated foundation interfaces. Layer 9 supplies
pinned integral split models. StableReduction Layer 2 owns finite-type relative
Proj and proper-curve cohomology/base change. The new work imports both rather
than putting duplicate constructions in foundational campaign layers.

The atlas, new roadmaps, packets, integrated decompositions, paper results and
reserved IDs were screened. Accepted RS25 and RS31 boundaries were checked.
The separate Gille–Parimala semiglobal-flags proposal concerns a different
arithmetic direction; it is not a regular-semilocal GS owner.
LefschetzPencilsAndVanishingCycles:LPV.3 supplies relevant shared incidence
geometry, but its finite-field point after extension is not CES22's original
base-field presentation theorem. Existing special Bertini/projection uses
are not treated as complete general owners.

## Routes

Six source routes retain the shared foundation owners:

- SchemeAndStackFoundations:SF.0: regular maps, approximation, étale components
  and the affine-target comparison.
- SchemeAndStackFoundations:SF.1: torsors, twisting, torus purity, nonabelian
  sequences, flat-neighborhood patching and filtered affine H¹ vanishing.
- SchemeAndStackFoundations:SF.2: quasi-coherent and supported cohomology,
  flat excision and multiplicative-type H².
- SchemeAndStackFoundations:SF.4: formal gluing, including the non-Noetherian
  input needed for arbitrary semilocal rings.
- DeformationAndDerivedPatchingAlgebra:R03.3: regular-local/factorial and
  Cohen–Macaulay flatness algebra.
- ReductiveGroupsPartII:RG2.0a: the existing affine finite-type Weil restriction
  owner, with its Shapiro interface.

Two new directions are proposed as Part II extensions, not edits to upstream:

**Scheme, stack, cohomology and intersection foundations, Part II: arithmetic
geometric presentation** (SchemeAndStackFoundationsPartIIArithmeticPresentation)
owns the 41 geometric items beyond carrier-level foundations. Its final targets
are Proposition 4.1's relative curve fibration and Lemma 6.3's cartesian
affine-line presentation, with the exact finite/imperfect-field corrections.
The parent is its first prerequisite. The JSON brief specifies the imports,
all intermediate results, non-goals and degree/base-change guards.

**Reductive groups, Part II: unramified Grothendieck–Serre**
(ReductiveGroupsPartIIGrothendieckSerre) owns 63 missing application and
torsor-theory items (the checkpoint's 62 and the lifting lemma added for E4). It begins after the upstream reductive foundations and
imports the geometry extension and existing cohomology/descent suppliers.
Its exact final targets are 9.1, 9.3, conditional 9.5, its separately sourced
equicharacteristic consequence, 9.6 and the local/completion corollaries.

General henselian-DVR Bruhat–Tits scope is an unresolved boundary, not a
license to construct a second building. The inspected RG2.2/RG2.3 local-field
scope does not cover all imperfect/infinite residue fields needed by Guo.
The JSON requests an owner/scope decision for precisely those interfaces.

## Supplier reading boundary (checkpoint)

The main paper, CTHK97 §3, selected Moret-Bailly descent proofs, Gille's §3
and 2005 erratum, the Whitehead §4 and 2026 repair, and all of Guo v3 have been
read as recorded. Gille02's text encoding is corrupted; its relevant pages
were read as images, including the introductory standing hypotheses.

The highest-priority missing primary chains are CTS87 and CTS79 purity,
GLL15/Gab01 Bertini, the relevant SGA3/EGA interfaces, Moret-Bailly's earlier
descent algebra, non-Noetherian formal gluing, Gil21/Alp14, Harder/Tits/Borel–Tits,
general henselian Bruhat–Tits, Popescu's linked proofs, FP15/Pan20, and CT79
cancellation. Each gap names its consumers. The report makes no claim that all
transitive definitions and lemmas have already been enumerated.

The handoff records the executed checker and custom audits. No catalogue,
upstream document, packet, audit or library file is changed by this submission.

## Mistakes found (`sourceIssues`)

- **E1** (error; affects the proof), Proof of Lemma 6.3, author PDF p. 20 (the published version p. 18, without the footnote). *Printed:* Consequently, by [BouAC, Chapitre IX, Section 3, numéro 3, Théorème 1], the thickening ε_z := Spec_{O_{C_{k_m}}}(O_{C_{k_m}}/I_z²) is isomorphic to Spec(k_z[u_z]/(u_z²)). *Correction:* The Cohen-structure isomorphism need not be an isomorphism of k_m-schemes when k_m is imperfect, and the construction of j needs one. For imperfect (hence infinite) k_m, embed each ε_z in A¹_{k_m} by the geometric presentation theorem [CTHK97, Theorem 3.1.1] applied in C^sm_{k_m}, and make the images disjoint by translations t ↦ t + α with α ∈ k_m. For perfect k_m the printed argument stands. *Reason:* Example: k_m = F_p(s), C = A¹_{k_m}, z = V(t^p − s), u = t^p − s. The p-th powers in O/I_z² = k_m[t]/(u²) lie in k_m^p[t^p] = k_m^p[s + u]; writing h ∈ k_m^p[x] by exponents mod p, h(s) = s forces h′(s) = 1, so h(s + u) ≡ s + u. No element has p-th power s, so there is no k_m-algebra map k_z = k_m(s^{1/p}) → O/I_z². *Known:* The author's post-publication footnote on p. 20, in arXiv 2009.05299v7 (8 November 2022) and the author's PDF of the same date; the published version lacks it..
- **E2** (gap; affects the proof), Cited input: Gille, Torseurs sur la droite affine, Transform. Groups 7 (2002), proof of Lemme 3.12, p. 239; used in the proof of Proposition 8.4, claim (1), author PDF p. 25. *Printed:* On peut donc supposer la classe γ_η isotrope. Il existe donc un k-sous-groupe parabolique j : Q/k = Z_G(S_0)·R_uQ ⊂ G/k (avec S_0 ⊂ S) tel que γ_η = j_*(β) ∈ Im(H¹(k(t), Q)_an → H¹(k(t), G)). *Correction:* First show that G has a k-parabolic of the type I of a minimal parabolic of the twisted group E(G)_{k(t)}: the scheme E(X_I) of parabolics of type I is proper over P¹_k and has a k(t)-point, so it has a P¹_k-point; its fibre at ∞ is X_I because E_∞ is trivial, so X_I(k) ≠ ∅. The rest of the proof is unchanged. *Reason:* The existence of a k-parabolic of G carrying the generic class is asserted without argument; the isotropy of γ_η only gives a parabolic of the twisted group over k(t). CES22 already cites the correction ('see also [Gil05]'), and the lemma's statement is unchanged. *Known:* Gille, Errata: « Torseurs sur la droite affine », Transform. Groups 10 (2005), 267–269, pp. 268–269.
- **E3** (gap; affects the proof), Cited input: Gille, Le problème de Kneser–Tits, Astérisque 326 (2009), proof of Lemme 4.5(1), p. 54 (page 15 in the errata, which use another pagination); used in the proof of Proposition 8.4, claim (2), author PDF p. 25. *Printed:* Vu que Z_ℌ(𝔖)/𝔖 est un schéma en groupe réductif dont la fibre spéciale est anisotrope, la théorie de Bruhat–Tits montre que (Z_ℌ(𝔖)/𝔖)(O) = (Z_ℌ(𝔖)/𝔖)(K) [10, 4.6.33]. […] Par ailleurs, il est bien connu que 𝔖(K) ⊂ ℌ(K)^+ [7, prop. 6.11]. (Symbols transcribed; the text layer is garbled.) *Correction:* For M = Z_ℌ(𝔖)/𝔖, first prove that M_K is anisotropic: Par(M) is smooth and projective, so Par(M)(K) = Par(M)(O) = Par(M)(k) are singletons, and the radical torus of M is K-anisotropic because its cocharacters over K, O and k agree. Then Guo's Proposition 6 gives M(O) = M(K). The Borel–Tits reference is Corollaire 6.8, not Proposition 6.11. *Reason:* Anisotropy of the special fibre does not by itself give M(O) = M(K); the cited Bruhat–Tits result needs M_K anisotropic, which the proof does not establish. The statement of the lemma is unchanged. *Known:* Gille, Errata et compléments (math.univ-lyon1.fr/~gille/prenotes/errata.pdf), dated 26 May 2026, p. 4, pointed out by A. Zidani.
- **E4** (gap; affects the proof), Proof of Proposition 8.4, claim (2), author PDF p. 25 (the published version p. 24). *Printed:* For the claim (2), we first note that the isotropicity assumption implies that G has a proper parabolic subgroup P ⊂ G (see Definition 8.1). *Correction:* Definition 8.1 gives a proper parabolic only over each local ring of R. Either strengthen the hypothesis for semilocal R as the author later does (each simple factor contains G_m over its own finite étale base; automatic for quasi-split G, the case Theorem 9.1 uses), or keep the hypothesis and work one maximal ideal at a time. For each m take a proper parabolic P_m of G_{R_m} and an opposite P_m^−. For Noetherian R, spread them out over R_g with g a nonzerodivisor of R_red outside m and inside the other maximal ideals, and lift points of R_u(P_m^±)(k_m((t))) to G(R((t))) through coordinates in g^N·R((t)). The lifts are 1 at the other maximal ideals. A limit argument reduces Proposition 8.4 to Noetherian R. The items state this repair. *Reason:* Example: let Ō be the semilocal ring of A¹_Q at two closed points with residue fields L₁ (cyclic cubic) and L₂ = Q(i), and R = {f ∈ Ō : f(q₁), f(q₂) ∈ Q}, a one-dimensional Noetherian semilocal domain with residue fields Q, Q. Milnor patching of M₆(Ō) with M₂(D) and M₃(H) gives an Azumaya R-algebra A of degree 6, where D is a cubic division algebra split by L₁ and H = (−1,−1)_Q. Here A is split over Frac R, and A_{R_{m₁}} ≅ M₂(D′), A_{R_{m₂}} ≅ M₃(H′), since the patching over each local ring is unique. So G = SL₁(A), simply connected of type A₅, is totally isotropic. An R-parabolic would have a single type, since Dyn(G) is constant, proper on both closed fibres SL₂(D) and SL₃(H). Their parabolics are the flags of reduced dimensions in {3} and in {2, 4} respectively, so there is none. Theorem 9.1 is unaffected: it applies Proposition 8.4 to quasi-split G, which has a Borel over R. *Known:* Česnavičius, Problems about torsors over regular rings, arXiv 2201.06424v4 (5 May 2025), p. 26: the post-publication footnotes to the proof of Lemma 3.5.5 (which cites [Čes22, proof of Proposition 8.4]) and to Remark 3.5.6 say that for semilocal A the total isotropy assumption should be strengthened, because it supplies a parabolic 'only after base change to each local ring'..
- **E5** (misprint; affects nothing), Proof of Proposition 8.4, last sentence, author PDF p. 25 (the published version p. 24). *Printed:* For this, we combine the surjectivity of the map R((t)) ↠ ∏_m k((t)) with [SGA 3 …] *Correction:* R((t)) ↠ ∏_m k_m((t)) *Reason:* No field k is defined in this proof; the product runs over the maximal ideals m with residue fields k_m, as in the display of claim (2) just above. *Known:* new.
- **E6** (misprint; affects nothing), Proof of Theorem 9.5, author PDF p. 28 (the published version p. 26). *Printed:* y ∈ H¹(R, Out(G, B)) whose image in H¹(R, Out(G)) is also x̄ *Correction:* y ∈ H¹(R, Aut(G, B)) *Reason:* Out(G, B) is not defined; y is the image of x̄ under the splitting Out(G) ↪ Aut(G, B) of the displayed sequence 1 → B^ad → Aut(G, B) → Out(G) → 1, and twisting by it produces A₀. *Known:* new.
- **E7** (error; affects nothing), Proof of Corollary 9.6, first sentence, author PDF p. 28 (the published version p. 27). *Printed:* Every inner form of SO_n is an SO(E) for a nondegenerate quadratic space E over R of rank n. *Correction:* Every twist of SO_n by an SO_n-torsor is an SO(E) for such an E; these are the only twists the argument uses. *Reason:* For even n ≥ 4, inner forms also come from central simple algebras with orthogonal involution. Over R = Q (allowed in Theorem 9.1 with O = Q), take H = (−1,−1) and H′ = (−1,3), non-isomorphic quaternion algebras ramified at {2, ∞} and {2, 3}. Then SO(H ⊗ H′, γ ⊗ γ′) ≅ (SL₁(H) × SL₁(H′))/μ₂ is an inner form of split SO₄. It is not an SO(E): for E of trivial discriminant, SO(E) ≅ (SL₁(C) × SL₁(C))/μ₂ with isomorphic factors. For odd n every form is an SO(E), and the proof only twists by H¹(R, SO_n). *Known:* new.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result.

The following was also checked:
- **Items and routes.** Item ids are unique, and every prerequisite and every `uses` entry resolves. Every missing item is routed exactly once, and there are no unrouted items.
- **Wording.** The spacing stripped from the checkpoint's text ("Proposition8.4", "the2005") was restored mechanically. Ids, hashes, URLs and citation keys were left untouched.
- **Findings.** Every finding was checked at its locator, in the author PDF and in the published version.

No Lean deliverable is part of a paper job.

**For the reviewer.**
- Check the E4 example and the per-maximal-ideal repair (items local-parabolic-loop-lifts and loop-coset-surjective).
- Check the E7 example.
