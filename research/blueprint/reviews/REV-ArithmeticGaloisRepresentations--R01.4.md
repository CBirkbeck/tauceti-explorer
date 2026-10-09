# Independent review: Arithmetic Galois representations, R01.4

**Verdict: accepted after corrections.** Reviewer: `independent-review-REV-ArithmeticGaloisRepresentations--R01.4`; agent: Codex; session: `codex-kJJtVS`; date: 2026-10-09. Input: BP-ArithmeticGaloisRepresentations--R01.4, submitted by the different session `codex-8COGDm` in PR #8112. This review certifies a plan, not a formalization.

The target-level rule in current `detail.json`, WORKERS and PROTOCOL §0/§2 governs the older lemma-level instruction in the generated issue. All 13 supplement nodes and 31 inherited principal targets were checked, together with all 19 inherited completion obligations. The seven definitions/constructions have 42 API entries and 29 acceptance tests, at least four per object. One API entry is explicitly an illustration of existing trace/norm results, so it must not become an independent implementation task. No new nodes or planets were added; the parent's six selected R01.4 planets remain in force. The complete pass and closed R01.4 coverage are justified. R01.1/R01.2's unrelated remaining obligations and the parent G7 adequacy/Schur gap remain outside that verdict.

## Corrections

1. `induction_subgroup_count` lacked absolute irreducibility. In characteristic three the unipotent U=[[1,1],[0,1]] and S=diag(−1,1) generate a projective D₆, but the unique index-two rotation subgroup fixes only the globally invariant line. There are zero inducing choices under the proposed criterion. Added the full-matrix-span hypothesis, the typed negative acceptance example `affine_dihedral_three_line_test`, and the explicit hypothesis/counterexample in reader §5 and inherited resolution 6. This changes the consumer signature, not the retained parent ID.
2. `isOdd_tensor_character` used `Module.finrank A M = 2` over any commutative ring. That does not establish constant local rank two: over ℚ×ℚ a module of local ranks two and three has finrank two, and a twist valued (−1,−1) changes determinant by (1,−1). Replaced the prototype hypothesis by a `Fin 2` basis. Reader §1 retains the finite-projective target with constant local rank two and proves it after localization; resolution 1 states that requirement. R01.1's reviewed determinant-through-a-complement interface supplies the algebraic determinant.
3. `nonsplit_trace_det` was a fresh placeholder for a conjunction already provided by the pinned coordinate library. Added `TauCeti.GL2NonSplitTorus.trace_gl2NonSplitTorusHom` and `val_det_gl2NonSplitTorusHom` to the baseline and direct prerequisites, proved the conjunction by those declarations, and marked it as compatibility illustration rather than new work in both packet and reader. The intrinsic field-subalgebra unit subgroup and its transport are still new targets.
4. The general upstream Clifford target uses Maschke; it cannot alone supply residual restriction when the characteristic divides the image order. Reader §5 and resolution 6 now spell out the invariant-line orbit/span argument and distinguish that local rank-two proof from imported general induction. No modular Clifford programme is duplicated.
5. Corrected reader/upstream-note ownership: LocalFieldsRamification Layers 2 and 4 supply inertia and tame Kummer characters, and R01.2 supplies residual fundamental-character interpretation and coherent local restriction. LocalGaloisGroups owns local cyclotomic/maximal pro-p theory. Added the exact two R01.2 refinement prerequisites to the arithmetic witness. Their reviewed statements were read, including the norm identity θ₂^(p+1)=θ₁.
6. Removed reader §9's irrelevant q=9 example from a statement assuming p≥5 and exponent at least two. In that range the exact minimum-index bound has no exceptional field.

Both source-issue objects now contain independent `confirmed` verdicts. E1401 was checked on the published Allen et al. proof of Lemma 7.1.8(2), pp. 1091–1092: GL₂(F₂) has normal C₃ and GL₂(F₃) has normal Q₈. The central-or-containing-SL₂ theorem requires q≥4; the prime-field determinant consequence holds at 3 by its separate normal-subgroup list and fails at 2. E1402 was checked on BCGNT arXiv v3 p. 52 and published p. 47: product factors have independent automorphisms, requiring Aut(S)^r before the permutation action. These remain references to already registered E100 and E26, not new erratum discoveries. No source passage is reproduced.

## Mathematical closure and acceptance examples

The difficult new proof obligations have actual routes. Steinberg's Theorem 3.2 and §§3.3–3.6, 4.10, 5.1–5.2, 5.7, pp. 608–613, reconstruct a field automorphism from root parameters. Type A₁ has no graph component. PGL conjugation absorbs the diagonal component; the trivial centralizer proves uniqueness. Restriction to the characteristic derived PSL subgroup gives the PGL extension. This applies at q=4 and q=9 and replaces an unread Dieudonné reference.

For characteristic-two H¹, odd-order torus averaging normalizes a cocycle to zero on the torus. An involutory root element forces its value into its matrix centralizer; addition and the transitive squared torus parameters force the scalar coefficient to vanish and the off-diagonal coefficient to be linear. A diagonal coboundary kills that value. The Borel then has zero cocycle, and averaging the invariant affine point over its odd number q+1 of right cosets gives a global fixed point. This proof works over every extension coefficient field and includes scalar matrices; it does not invoke the unread Dickinson Lemma 42 or an unread Ext theorem. Khare–Wintenberger II Lemma 4.3(5)(i), pp. 40–41, and Guralnick–Herzig–Tiep Corollary 9.4, pp. 1282–1283, corroborate its conclusion.

The niveau-two witness is arithmetic rather than assumed data. For α⁴=−3, adjoining i gives the splitting field with r(α)=iα, s(i)=−i and s(α)=α. Its group is D₈. The matrices R=[[0,−1],[1,0]], S=diag(1,−1) over F₃ have full four-dimensional matrix span. Complex conjugation is r³s and has determinant −1. The quadratic field ℚ(√−3) is fixed by the diagonal-image subgroup generated by r² and s. Locally ℚ₃(i) is unramified quadratic and X⁴+3 is Eisenstein; inertia has order four, with eigencharacters ω₂² and ω₂⁶. The projective inertia has order two and is genuinely niveau two. Dieulefait–Pacetti Lemma 1.14 and Remark 5, p. 9, supply the criterion being tested, not the example itself.

The cyclotomic field construction uses squares of the actual cyclic Galois group. Over F=ℚ(√5) at p=5 its fixed field is the quadratic extension F(ζ₅), although F(√5)=F. That test prevents replacing the definition uniformly by F(√p*). Projective trace tests distinguish invariants from arbitrary matrix-entry fields. Totally odd tests detect nilpotent coefficient errors and failure to quantify over every real place. Cartan tests distinguish ordered pointwise fixation, coordinate transport and small-field exceptions.

Independent finite-matrix enumeration gave:

| Field | GL₂ order | Split Cartan / normalizer | Nonsplit Cartan / normalizer |
|---|---:|---:|---:|
| F₂ | 6 | 1 / 6 | 3 / 6 |
| F₃ | 48 | 4 / 8 | 8 / 16 |
| F₅ | 480 | 16 / 32 | 24 / 48 |

The same check verified the D₈ image order eight, matrix span of cardinality 81, diagonal quadratic restriction of order four, and the reducible affine D₆ counterexample. These are sanity checks of the proposed examples; the Lean tests still specify goals with honest proof placeholders.

## Baseline and upstream audit

All 29 original baseline statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; the two trace/norm results bring the total to 31. No baseline citation was removed. Each entry's independent-check evidence was refreshed. Important boundaries checked were:

- `Field.absoluteGaloisGroup` supplies a group, Krull topology and topological-group instance, not the missing profinite instances; the reviewed R01.1 separable-group transport supplies those.
- `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple` requires 4≤Nat.card F; `Matrix.SL2.commutator_eq_top` requires a unit whose square is not one. The finite-field hypotheses in the consumers provide these at q≥4.
- The diagonal-normalizer permutation equivalence assumes a nontrivial unit group, so the split Cartan at F₂ is handled separately. The nonsplit centralizer theorem requires the unit outside the base-field image.
- The cyclotomic automorphism injection needs a primitive root and a cyclotomic extension; `galEquivZMod` is its rational specialization. `gaussSum_sq` needs a nontrivial quadratic multiplicative character and primitive additive character. The rational square-field proof supplies them.
- `groupCohomology.H1` and its cocycle quotient are existing infrastructure, not the desired vanishing theorem.

The reviewed AUDIT-31 R01.4 record marks the finite-image analysis absent and records the existing GL₂ coordinate torus/Borel/conjugacy inputs. Current read-only TauCetiRoadmap and Tau Ceti were searched as well as the older snapshot. InductionRestriction and ClassicalGroups were read as nearby roadmap exemplars; the current local Galois and ramification interfaces were checked for ownership. No existing finite-subgroup classification, bad-dihedral predicate or rank-one semilinear-automorphism result was found. Coordinate Cartans and their trace/norm/centralizer formulas are explicitly reused. Current Tau Ceti expresses its quadratic-extension coordinate API by a typeclass rather than the pinned finrank argument: package authors should bind to its then-current API, without re-planning the formulas. No roadmap or library outside the issue's allowed files was changed.

## Node-by-node checks

The first 13 entries are the supplement nodes; the remaining 31 are inherited principal targets checked through the reader, suggested signatures and parent contract. Corrected inherited entries mean corrections to their local consumer/interface, not an edit to the parent packet.

| Node | Verdict | Evidence |
|---|---|---|
| `complex-conjugation` | verified | Transport on the algebraic image constructs conjugation; extension of embeddings proves conjugacy. Serre 1987 §1.3 p. 182 supports the rational source convention; the number-field extension is identified as a derivation. |
| `totally-odd-character` | verified | The all-real-place character predicate is choice invariant. The five tests separate characteristic two, nilpotent coefficients, different real places and imaginary fields. Constant local rank two is now explicit for the inherited representation-twisting consumer. |
| `split-cartan` | verified | Complementary lines give the unit-product subgroup and the existing coordinate torus. The F2 normalizer exception is retained; the existing permutation quotient requires nontrivial units. |
| `half-cartan` | verified | The second line is fixed pointwise, not merely preserved. Determinant identifies the subgroup with k units; the F2 degeneracy and axis test detect an unordered-pair substitution. |
| `basis-free-nonsplit-cartan` | corrected | The field-subalgebra unit image is a new intrinsic interface; coordinate models already exist. Added the two pinned trace/norm baseline references and proved the compatibility conjunction from them, explicitly excluding it as a fresh target. |
| `cartan-normaliser-semilinear` | verified | Normalizing a quadratic field subalgebra acts by identity or Frobenius; multiplication plus Frobenius gives the converse. The trace-zero, square/norm and quotient formulas agree with Serre 1972 §2.2 p. 279. |
| `regular-semisimple-cartan` | verified | Nonzero characteristic-polynomial discriminant gives the unique split or quadratic-field centralizer. The existing nonsplit centralizer requires a non-base-field unit, exactly the regular nonsplit situation. |
| `cartan-contained-in-normaliser` | verified | Serre Proposition 14 pp. 279–280 supplies equality at the stated bounds. The split field of three elements remains excluded; the half-Cartan bound is separate. |
| `projective-trace-field` | verified | Trace squared divided by determinant is scalar and conjugacy invariant. Standard SL2 traces recover every coefficient-field element after squaring in the finite field; the q>=4 boundary and proper-subfield tests are substantive. |
| `cyclotomic-square-subfield` | verified | The square subgroup is taken in the actual cyclic Galois group, not in the full ambient prime-field unit group. Fixed-field degree, rational Gauss sum and the F=Q(sqrt(5)), p=5 counterexample check the convention. |
| `semilinear-projective-automorphisms` | verified | Steinberg Theorem 3.2 and §§3.3–3.6, 4.10, 5.1–5.2, 5.7 pp. 608–613 supply the rank-one proof. A1 has no graph component; trivial centralizer and the characteristic derived subgroup give uniqueness and the PGL extension, including q=4 and q=9. |
| `characteristic-two-matrix-cocycles` | verified | Odd-order torus averaging, root-group centralizers, squared torus parameters and odd-index Borel averaging prove the all-extension-field statement. No unread Dickinson or Ext computation is used; the scalar summand remains present. |
| `niveau-two-bad-dihedral-witness` | corrected | Verified the X^4+3 splitting-field, odd D8 action and local e=4 calculation. Added the exact reviewed R01.2 residual-character bridge and coherent-restriction prerequisites, distinguishing them from LocalGaloisGroups ownership. |
| `odd-representation` | corrected | Replaced the insufficient finrank-over-a-ring hypothesis in isOdd_tensor_character by a Fin 2 basis; reader states the constant-local-rank projective target and the varying-rank counterexample. |
| `rational-lines-of-a-split-nonscalar-element` | verified | Two distinct eigenvalues or one nonscalar Jordan block account for all invariant lines after coefficient extension; nonscalarity is indispensable. |
| `odd-irreducible-implies-absolutely-irreducible` | verified | Odd conjugation supplies distinct eigenvalues in odd characteristic; descent of its invariant lines gives the irreducibility implication. |
| `absolute-irreducibility-from-dyadic-conjugation` | verified | A nonidentity involution in characteristic two is a nonscalar unipotent; identity conjugation is explicitly excluded by the order-three F2 example. |
| `dickson-classification-and-the-dyadic-refinement` | verified | The root-subgroup and tame cyclic-partition chains cover affine, cyclic, dihedral, exceptional and standard images. Dickson Chapter XII and DDT Theorem 2.47 p. 81 were checked. |
| `conjugacy-of-standard-projective-images` | verified | Dickson subfield and exceptional-generator constructions give conjugacy over PGL; the reader does not confuse PSL conjugacy classes with PGL conjugacy. |
| `projective-image-and-its-coefficient-field` | verified | The standard coefficient field is reconstructed from projective invariants, with the point-fixing alternative separated from absolute irreducibility. |
| `linear-image-over-the-projective-trace-field` | verified | Perfectness lifts the commutator of a standard projective image to the same conjugate of SL2; the scalar-times-GL2 descent uses that model, not the arbitrary entry field. |
| `dyadic-solvable-projective-image` | verified | Under absolute irreducibility, the characteristic-two soluble classification leaves dihedral groups with odd rotation order at least three. |
| `dyadic-nonsolvable-projective-image` | verified | The nonsoluble dyadic standard group is PSL2(F2^r), r>=2; finite-field squaring identifies PGL and PSL and the linear commutator is SL2. |
| `large-order-projective-image-criterion` | verified | Large order excludes exceptional groups only after absolute irreducibility removes the Borel. The prime-field SL2 conclusion also excludes Cartan normalizers; Clozel–Thorne Lemma 7.5 pp. 48–49 has the stronger source inputs. |
| `subgroups-of-gl2-over-a-prime-field` | verified | Normal Sylow versus opposed transvections gives the characteristic-dividing-order alternative; Serre Proposition 15 p. 280 has the same prime-field setting. |
| `prime-to-ell-subgroups-of-gl2` | verified | Cartan, normalizer and exceptional cases match Serre Proposition 16 p. 281, including the 2/3 exclusions and the A5 congruence. |
| `semisimple-subgroups-over-a-prime-field` | verified | A reducible semisimple plane is diagonal; the irreducible branch retains both prime-to-characteristic and SL2 alternatives. |
| `subgroup-containing-a-cartan` | verified | Serre Proposition 17 p. 282 and its p=5 remark p. 283 distinguish full nonsplit Cartans from split half-Cartans. |
| `normal-subgroup-containing-a-cartan` | verified | Serre Proposition 18 p. 283 requires the normal-subgroup hypothesis and excludes the field of two elements. |
| `cartan-subgroups-and-normalisers` | verified | Intrinsic split/half/quadratic carriers transport to existing models; the field of two elements is treated outside the generic split quotient formula. |
| `p-subgroups-and-borel-subgroups` | verified | A nontrivial p-subgroup has one fixed line; normality makes it globally stable. The full GL2 Sylow order and q+1 count are typed. |
| `subgroups-of-psl2-with-several-sylow-p-subgroups` | verified | Dickson §§251–253 pp. 272–278 give the multiplier field, divisibility, A/B alternatives, dyadic dihedral case and characteristic-three A5 case; printed p. 274 was also inspected as an image. |
| `finite-subgroups-of-pgl2-of-order-prime-to-the-characteristic` | verified | Unique maximal cyclic membership and normalizer index at most two yield the stated class equation; its numerical solutions recognize cyclic, dihedral, A4, S4 and A5. |
| `two-transvections-generate-sl2-over-a-prime-field` | verified | Nonzero opposed root parameters generate both full prime-field root groups; elementary row operations then generate SL2. |
| `dihedral-projective-image-iff-induced` | corrected | Added absolute irreducibility to induction_subgroup_count and the affine D6 characteristic-three negative acceptance signature. The reader and inherited obligation now use the modular line-orbit proof instead of Maschke-only Clifford. |
| `irreducible-with-abelian-projective-image-is-klein` | corrected | Made the invariant-line orbit/span and scalar-centralizer restriction argument explicit in modular characteristic. An irreducible abelian projective image is the Klein case; no unrestricted upstream Clifford theorem is assumed. |
| `bad-dihedral-representation` | verified | The actual Galois restriction predicate uses the square-subgroup field; finite odd-characteristic coefficients and absolute irreducibility supply the induction equivalences. |
| `bad-dihedral-representations-and-the-oddness-criterion` | verified | The cyclic square-subgroup criterion, p-power restriction, exact projective inertia order two and both niveau divisibilities are typed without an added oddness assumption. |
| `image-of-restriction-to-a-subfield` | verified | Kernel-field intersections are identified through the original factorization maps. Joint-field disjointness controls the cyclotomic image; a perfect subgroup survives each soluble quotient. |
| `normal-subgroups-and-automorphisms-of-psl2-pgl2` | verified | The q>=4 central-or-containing-SL2 result and q=2,3 lists are consistent. Semilinear uniqueness, independent product automorphisms and fixed-characteristic Goursat intersections are supplied; source misprint E26 is confirmed. |
| `restriction-to-the-cyclotomic-field` | verified | All eight clauses are mapped to typed signatures or explicit reader proofs. Determinant hypotheses in the 3/5 exceptions, cyclotomic noncontainment, and trace-zero scalar elimination remain explicit. |
| `large-image-persistence` | corrected | The small-index strengthening to exponent a>=2 follows from the exact PSL2 minimum; removed the irrelevant q=9 example under p>=5. The pure Galois tame-inertia criterion is justified separately from the automorphic source. |
| `minimal-index-of-proper-subgroups-of-psl2` | verified | Dickson §262 pp. 286–287 supports q+1 with the six listed exceptional minima. For p>=5 and exponent at least two none of those exceptional fields occurs. |
| `characteristic-two-residual-image-facts` | verified | Scalar centralizers, zero quotient invariants, the four submodules and the Frobenius-squared off-diagonal action are distinct interfaces; the all-field cocycle proof closes the separate H1 obligation. |

## Source versions and verification

The 15 recorded public files were fetched and their SHA-256 values matched `sourceVersions`. Each supplement-node locator and each source issue was read directly; retained principal clauses were checked against the cited primary arguments. Scanned Serre 1972 pp. 278–283 and Dickson p. 274 were also inspected as images. Published and preprint pagination are kept distinct.

| Source version | URL |
|---|---|
| accplus-cm-potential-automorphy (published) | [public PDF](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) |
| bcg25-gln (published) | [public PDF](https://www.math.uchicago.edu/~fcale/papers/WeightZero.pdf) |
| bcgnt25 (preprint) | [public PDF](https://arxiv.org/pdf/2309.15880v3) |
| cn23 (preprint) | [public PDF](https://arxiv.org/pdf/2301.10509v3) |
| ddt-fermat (author copy) | [public PDF](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) |
| dickson-linear-groups (published) | [public PDF](https://archive.org/download/lineargroupswith00dickuoft/lineargroupswith00dickuoft.pdf) |
| dieulefait-pacetti (preprint) | [public PDF](https://arxiv.org/pdf/2108.07577v2) |
| guralnick-herzig-tiep17 (published) | [public PDF](https://ems.press/content/serial-article-files/32200?nt=1) |
| kw-serre-modularity-I (preprint) | [public PDF](https://www.math.ucla.edu/~shekhar/papers/results.pdf) |
| kw-serre-modularity-II (preprint) | [public PDF](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) |
| nt26 (preprint) | [public PDF](https://arxiv.org/pdf/2212.03595v2) |
| serre72-proprietes (published) | [public PDF](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5874918517843398173_Serre_proprie_te_s_galoisiennes_des_courbes_elliptiques.pdf) |
| serre87-duke (published) | [public PDF](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf) |
| steinberg60 (published) | [public PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/16023F257E0F21D57873B1450E9F15E4/S0008414X00010245a.pdf/div-class-title-automorphisms-of-finite-linear-groups-div.pdf) |
| bcgnt25 (published) | [public PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/0A073881B84E8654DB6D11D064B78A4B/S2050508624000295a.pdf/the-ramanujan-and-sato-tate-conjectures-for-bianchi-modular-forms.pdf) |

For retained citations, also checked [Clozel–Thorne, accepted manuscript](https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf), Lemma 7.5 and proof pp. 48–49 (SHA-256 `a3fa46fcdebdc1a41a54e8b5a9be22173e9f9f87261c51b1e7a7f29cfada3659`), and [Calegari–Geraghty, author typeset copy](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), Remark 4.12 pp. 819–820 (`fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5`). The latter supplies the prime-field inner-automorphism application, while Steinberg supplies the full finite-field proof. No restricted book or source excerpt is required for this review.

## Validation and orchestrator handoff

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisRepresentations--R01.4.json`: 0 errors, 0 warnings. `lean-check research/blueprint/suggested/ArithmeticGaloisRepresentations--R01.4.lean`: exit 0, 177 warnings, all `declaration uses sorry`; no other warnings or errors. Elaboration checks the signatures, not the proof sketches. `git diff --check` passed. Only the packet, reader, suggested file, this report and the issue handoff are changed.

No unresolved mathematical question is sent back. Assembly/package must use the corrected absolute-irreducibility and constant-rank hypotheses, omit the coordinate trace/norm conjunction as an independent task, and import the named existing suppliers. It must preserve the separate parent G7 gap and the remaining obligations of other parts. Do not reopen the two R01.4 source/proof gaps: this review checks their explicit replacements.
