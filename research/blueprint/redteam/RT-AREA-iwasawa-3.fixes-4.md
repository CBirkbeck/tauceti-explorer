# Fourth Iwasawa fix round

Refs #8925. Job `FIX-RT-AREA-iwasawa-3~4`, Codex, session `codex-rmGSAt`,
17 October 2026. Input revision `6c7405889b6fbfa6106642e0d38840fd670ccc8c`.
Claim comment 6241297883 was confirmed by the bot in comment 6241300943.

This completes the bounded fix pass. The remaining GH consumer hypothesis
and Kato Hecke exponent are corrected. The Motives owner now specifies the
full localized comparison adapter, its actual fibres and comparison, both
actions and the period point. PS.9 imports that interface. PS.2's integration
application remains assigned to `BP-PeriodsAndSpecialValues--PS.0`; the exact
excluded atlas edit is supplied below.

The original eight findings and their verification, the preceding fix report,
and the independent third-round review were read. All affected owner nodes,
their reader statements and proposed Lean interfaces were checked. Independent
`review` and `reviewHistory` objects are preserved exactly, including the
Motives `needs_changes` verdict. No stage is made closed and no unchecked
implementation is promoted. This is a roadmap specification, not a proof of
Nori reconstruction or of the arithmetic geometry.

## Disposition of all eight findings

| Finding | Disposition and discriminating check |
|---|---|
| /1 CM product | GH.0's existing `cm-product-good-model` already separates the Kuga–Sato model from the independently supplied CM elliptic model. GH.1/`p-adic-abel-jacobi-map` now separately requires finite unramified F/Q_p and specified smooth proper C and X_m models over O_F. The conductor condition p∤cNd_K is identified as BDP's selected-CM application, rather than a certificate for arbitrary twists. Reader, Lean caveat and revision handoff are synchronized. At p=5 the CM twist y²=x³−25x has minimal discriminant valuation 6 and bad reduction, although 5∤7. The positive y²=x³−x example has discriminant 64, a unit at 5; with the supplied W_m model at level 13 its product has a smooth proper model over the common O_F. No assertion that every Bloch–Kato containment theorem needs an unramified field is introduced. |
| /2 Moment twist | Already corrected in the Kato owner packet, reader and suggested signatures; retained after fresh source check. The orientation is Sym^(k−2)(T_pE)=Sym^(k−2)(H_p)(k−2). Adding the Chern/root twist gives 2−r+(k−2)=k−r. Weight two gives 1 and weight four gives 3 at r=1; the incorrect orientation would give −1 in weight four. |
| /3 Euler factors | Existing norm and reciprocity nodes retain linear coefficients ℓ^(−r), p^(−r), quadratic exponent k−1−2r, and the trivial p-factor when p divides M. Corrected the remaining upstream Lemma 8.8(1) exponent to n^(r′−1) in its statement and acceptance annotation. Added the transport calculation, two light scalar definitions, three packet/reader tests and three proved Lean regressions. For r=1,r′=2,n=2 the linear transport scalar is 1/2; using r in the Hecke exponent gives 1. The generic `chernHeckeDiamond` evaluation adapter now names the source scalar rather than taking an arbitrary scalar. It still requires the geometric intertwining law; it does not prove that law for arbitrary linear maps. |
| /4 Filtration | Already corrected; retained. The dual-exponential target is F⁰D_dR(V(i))≅F^iD_dR(V), a filtration step. The packet has the endpoint i≥k. At k=4 the interior F¹,F²,F³ agree with the modular-form subspace, while their interior successive quotients vanish. The i=4 test gives zero. The reciprocity acceptance uses the same filtration-step wording. |
| /5 Iwasawa twist | Already corrected; retained. Twist Iwasawa cohomology by j=k−r first, with the stated κ(σ)^(−j) semilinear action, then specialize, localize at p and apply exp*. The k=2,r=1 type test requires twist +1. The dual form, p-imprimitive value, F-rational gamma and sign convention remain. |
| /6 Local-duality limit | Already corrected; retained. The proof keeps residue-Galois invariants of inertia H¹, its local-duality identification with a Pontryagin dual, and the dual of the direct limit of residue-field H¹ under restriction. Corestriction in the original inverse system is dual to restriction. The residue-field union has p-cohomological dimension zero. The transition-map and μ_p tests distinguish the dual/direct construction from an undualized inverse-limit claim. |
| /7 Theta divisor | Already corrected; retained. The existence proof uses a_*D=D and div(N_a f)=a_*div(f), with a_* corresponding to [a] on Pic⁰(E). For c=5,a=2, pullback instead gives 25E[2]−E[10]; its coefficient at a nonzero 2-torsion point is 24 rather than 0. Thus the false pullback invariance cannot be used to prove principality. |
| /8 Formal periods | Refined the four existing MC.6 targets `formal-periods-equal-comparison-algebra`, `fibre-functor-extension`, `period-torsor`, `period-point`; no duplicate period presentation or category is introduced. The full adapter is specified below, in the packet API and the reader. The PS.9 numerical-spanning consumer now explicitly requires this full interface, preserving Brown's graded H and its A⊗H unipotent coaction. PS.2 integration and its 2πi normalization go to its existing owner job. |

The previously correct /2 and /4–/7 nodes are deliberately not rewritten to
manufacture changes. Their present source locators, hypotheses, proposed APIs
and distinguishing examples were inspected, and the full Kato suggested file
was freshly elaborated. The independent historical review notes are not
rewritten as though the new worker had issued those verdicts.

## Full Nori supplier interface for /8

The preceding review correctly distinguished a localization of an effective
coordinate ring from the comparison algebra of the actual full Nori diagram.
The reader's **Full Nori comparison adapter** section now gives exact domains,
canonical maps and compatibility equations for the missing link:

1. Fix the MC.5 integer-Tate extensions of the two good-pair representations.
   The coefficient map starts on a finite full subdiagram: restrict along
   v↦(v,0) and conjugate by the canonical degree-zero extension isomorphisms.
   Dualizing restriction defines j:A_eff→A_full on coefficient colimits.
   The packet states its formula and finite-inclusion square.
2. For ℓ=e_eff(L), prove `IsLocalization.Away ℓ A_full` **for that j**.
   A tensor-compatible effective transformation whose rank-one Tate map is
   invertible extends uniquely to all integer Tate powers. The statement
   and proof route use arbitrary commutative Q-algebras, not only complex
   points. This identifies the actual full comparison algebra before
   invoking the general Mathlib localization-equivalence API.
3. Export E:P_eff[L⁻¹]≃A_full, including E(ofEff x)=j(e_eff x), the coefficient
   formula on good generators and both inverse identities for E(L⁻¹).
4. Use the Betti-first comparison category of HMS Lemma 3.1 to construct
   the de Rham fibre on the already rigid full MM_Nori, its natural complex
   tensor comparison Φ, and the tensor equivalence from the full de Rham
   diagram category. Both fibres and Φ restrict to the supplied geometric
   comparison. Effective rigidity is never assumed.
5. Transport the full heap and both coactions through E. With ordinary
   functional composition, Betti acts on the left by b∘f and de Rham on
   the right by f∘d. Their coordinate types are H_B⊗P and P⊗H_dR.
   Counit, coassociativity, commuting actions and both torsor isomorphisms
   are part of the target. Converting an opposite action requires group
   inversion as well as flipping tensor factors.
6. The evaluation transported through E corresponds to precisely Φ. The
   point, heap and actions use the actual full fibres, without a separate
   effective `TannakianPair`. For any complex point x the unique factors
   are b=x∘Φ⁻¹ and d=Φ⁻¹∘x.

The geometric unit and both unital multiplicative structures are now explicit
in `PairDiagram.ProductCompatible`, as well as the already shared signed
Künneth laws. The reader retains the previous review's correction that the
all-pairs comparison becomes graded multiplicative after restriction to good
pairs. Two odd-degree signs cancel in coefficients.

New tests include finite-coefficient and generator compatibility; the
rank-one model Q[t,t⁻¹], its two coactions and heap; negative Tate powers;
a noncommuting rank-two matrix example detecting composition order; and
period-point conjugation. A normalized rank-one point sends t to 2πi and
t⁻¹ to its reciprocal, so both inverse identities evaluate to 1. In the
effective model t↦0 cannot extend through localization.

### Current roadmap shape and remaining implementation

WORKERS.md and PACKAGE_REVIEW.md require heavy constructions whose carriers
are absent at the pins to be exact reader targets, rather than sorry-defined
Lean data. The new `NoriPeriod.*` constructions follow that rule. The legacy
Motives prototype is already over 5,000 lines and contains admitted data;
this bounded fix does not make it a package or refactor all of its unrelated
layers. Its new Lean change is the explicit geometric-unit/unital contract
and a comment identifying the full reader targets. No new admitted data
construction or independently assumed neutral context is inserted.

The existing full-adapter gap is retained as an unchecked implementation
boundary, with its mathematical maps now specified. The MC.5 product-edge
and universal-property supplier gaps, relative Beck/reconstruction gaps,
Artin/Tate classification gap and other unrelated obligations remain.
No claim that successful elaboration implements the adapter is made.
The Motives reader's stale counts/current-review annotation and complete gap
list are synchronized; inherited source quotations are removed while their
locators and own-word correspondences remain.

## Exact PS.2 handoff and excluded atlas edit

Owner: `BP-PeriodsAndSpecialValues--PS.0`, PS.2. Do not create a second
formal-period presentation or Nori category. Import MC.6's single P_eff,
Tate symbol L, P=P_eff[L⁻¹], fullEquiv, actual full comparison point and
coactions; reuse MC.5 localization and rigidity. PS.2 proves that evaluation
is integration and that L evaluates to 2πi≠0, then extends evaluation by the
existing localization lift. Test L·L⁻¹=1, evaluation of L⁻¹=(2πi)⁻¹ and
Q[t,t⁻¹] as the rank-one Tate torsor. Evaluation injectivity remains conjectural.
This finding says nothing against 1/π being an effective numerical period.

For the maintainer, replace the PS.2 **Construct and export** paragraph in
`research/blueprint/atlas/roadmaps/PeriodsAndSpecialValues.json`'s stage
`PeriodsAndSpecialValues:PS.2` and its corresponding campaign README by:

> Import the effective formal-period algebra P_eff, its distinguished Tate
> symbol L and the full algebra P=P_eff[L⁻¹] from MC.6. Identify the integration
> symbols with the effective presentation using linearity, change of variables,
> Stokes and products. Prove that integration sends L to 2πi≠0 and extend it
> uniquely to a Q-algebra map P→C with L⁻¹↦(2πi)⁻¹. Use the MC.5 full Nori
> category and the MC.6 full comparison-algebra equivalence and tensor
> comparison to identify Spec P with the full period torsor. Separate these
> identities from conjectural injectivity of evaluation.

Replace that stage's **Acceptance** paragraph by:

> Verify multiplication by products of pairs and the values of basic algebraic
> periods. Check L·L⁻¹=L⁻¹·L=1, evaluation of L and its inverse, and the
> rank-one model Q[t,t⁻¹] rather than Q[t]. Trace the same integration relation
> through the full comparison-algebra equivalence and period point.

These indented paragraphs are proposed new atlas text in our own words, not
source quotations. The atlas and campaign paths were not edited. PS.8's
packet covers PS.8–PS.9, not PS.2; only its real downstream PS.9 consumer was
refined.

## Sources and reuse checks

Public sources read directly on 17 October 2026, only for the bounded results
used here; no protected book was needed and no source passage was added.

| Source | Locators checked | PDF SHA-256 |
|---|---|---|
| [Huber–Müller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | Definition 0.1/Theorem 0.2, p.2; Definition 1.1/Theorem 1.6, pp.4–5; Theorem 1.14, p.8; Definition 2.8/Theorem 2.10, pp.10–11; Lemmas 3.1–3.2, p.12; Theorem 3.3/Corollary 3.4, p.13; Definition B.14, pp.20–21; Lemma B.21/Proposition B.22, pp.25–26 | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Kato, Astérisque 295 (2004)](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | §1.10, p.124; §8.4, pp.182–183; Lemma 8.5, pp.183–184; Proposition 8.7, p.184; Lemma 8.8, p.185 (also checked on the page image); (9.2.2), p.187; Theorem 9.5, p.188; Theorem 12.5(1), p.221 | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [Bertolini–Darmon–Prasanna, published Duke version](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | Introduction, p.1040; §3.2, pp.1067–1068; §3.4, pp.1069–1070; Conrad appendix, pp.1139–1140 | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` |

Read the reviewed library-audit entries for GH.0, Kato L1 and PS.2. At the
pinned Mathlib commit, read `IsLocalization.Away.invSelf`, `mul_invSelf`,
`lift`, `liftAlgHom`, `IsLocalization.algEquivOfAlgEquiv` and the rational
algebra-map conversion. These supply localization infrastructure, not the
Nori identification. At pinned Tau Ceti, `fgPointTensorIsoEquiv` starts from
a known commutative Hopf algebra and finite comodules; it does not construct
these Nori fibres or comparison coefficients.

Current upstream was inspected read-only: roadmap environment revision
`0d144d044dacebca17b654695b6f1ad58f159b27`, current Tau Ceti library revision
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the complete README and
Suggested.lean of Completed/HodgeStructures and Completed/IntegralLattices,
and the current Tannaka equivalence. Their existing Tate/Hodge, lattice and
known-Hopf results are reused, not replanned. Searches for the Nori/formal
period/comparison-algebra supplier did not find it in the current trees.
No upstream file was changed and no lake command was run there.

## Fresh validation

- `python3 scripts/check_blueprint.py` on all four owner packets: zero errors,
  zero warnings. Node counts are GH 66, Kato 40, Motives 182, PS.8–PS.9 40;
  their gap counts remain 17, 14, 24, 5. No node or planet was added or removed.
- Fresh sequential `lean-check` runs of all four complete suggested files
  exited 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, with
  available memory above 20 GB. Warning counts: GH 242, Kato 134,
  Motives 817, PS.8–PS.9 192; every warning is `declaration uses sorry`.
  The three new Kato scalar regression proofs contain no `sorry`.
- Parsed comparison with the input confirms that every independent review,
  every review-history entry, every node id and every implementation status
  is preserved. The preceding Motives `fixes` record is archived intact in
  `fixHistory`; the new fix record is not an independent verdict.
- Whitespace and intake file checks pass. No link map, restructure, paper
  extraction or generated atlas output is changed, so their unrelated
  checkers have no new input.

The independent `REV-FIX-RT-AREA-iwasawa-3~4` remains required before any
reviewed-base promotion. Resume there, using the preserved gaps rather than
interpreting elaboration of placeholders as proof closure.
