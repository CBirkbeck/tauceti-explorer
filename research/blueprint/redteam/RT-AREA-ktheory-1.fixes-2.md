# Algebraic K-theory area fix, round 2

Job `FIX-RT-AREA-ktheory-1~2`, [issue #5541](https://github.com/CBirkbeck/tauceti-explorer/issues/5541). Two sessions did this round:

- **Codex, session `codex-5ebb6f`, 2 October 2026.** Wrote the repairs and the 38 dispositions on branch
  `codex-5ebb6f-fix-ktheory-2` (commit `52d782e2`). Its pull request #5643 conflicted with main and was closed unmerged.
- **Claude, session `claude-HJaFqR`, 6 October 2026.** Merged that branch with main `047b7c85`, as the orchestrator asked on
  the issue. It then reconciled the packets, made the corrections listed below and ran the checks. The bot confirmed the
  claim on comment 6025527211. This session did no earlier work on these packets, their red team, its verification,
  round one or its review.

Status: **complete disposition of the 38 confirmed high/medium findings (/1–/37, /39); independent review pending.** /38
was rejected by the verifier; /40–/49 are low severity and outside this fix. The round answers the objections of
[REV-FIX-RT-AREA-ktheory-1](../reviews/REV-FIX-RT-AREA-ktheory-1.md): its corrections C1–C12 and its "work still
required" list.

- K.1, K.6 and T.1 carry Codex's repairs.
- N.7 and T.3 carry main's dedicated fixes of the same obligations (next section).
- N.1 and K3BlochGroups keep their accepted repairs. K3BlochGroups also gets the V.5 correction below, and N.1's reader
  now has C1.

Nothing here asserts that a roadmap, a supplier or a Lean implementation is finished. Every node stays `unchecked`, and
each packet's `review` object is the last independent verdict, left for REV-FIX-RT-AREA-ktheory-1~2 to replace. No
campaign document, atlas data, supplier packet, issue label or Tau Ceti roadmap was edited.

## How the branch and main were combined

Between 2 and 6 October, two dedicated fix rounds merged into main. Each answered the area review's obligations for its
packet by a different route from the branch:

- [FIX-RT-BP-ArithmeticKTheory--N.7~2](RT-BP-ArithmeticKTheory--N.7.fixes-2.md) (#6707, Claude `claude-UNu5Ve`) for N.7;
- [FIX-RT-BP-K2SymbolsBrauer--T.3~2](RT-BP-K2SymbolsBrauer--T.3.fixes-2.md) (#6702, Codex `codex-DWTl3R`) for T.3.

Git conflicted on exactly these two packets, with their readers and suggested files.

| Area-review obligation | Branch route (not kept) | Main route (kept) |
| --- | --- | --- |
| N.7: upper generation for K₂(ℤ[i]) and K₂(𝓞_{ℚ(√5)}) | Direct Tate method in eleven N.8 nodes: Gaussian cutoff, golden-ratio Euclidean units, congruence lattices, norm cutoff q > 33, eleven finite prime certificates | Tate's method in five N.8 nodes: `tate-norm-filtration`, `tate-criterion`, `gaussian-tame-kernel-vanishes`, Zhang–Xu's `tame-kernel-of-q-zeta-five`, `real-quadratic-upper-generation` by restriction to ℚ(ζ₅) |
| T.3: K₂(ℤ) upper generation | Tate's S-unit filtration in seven T.5 nodes (`S-unit-symbol-filtration`, `tate-unit-residue-criterion`, …) | Milnor §10 in four T.5 nodes: `integer-steinberg-word-model`, `silvester-word-reduction`, `integer-kernel-in-monomial-subgroup`, `integer-kernel-upper-generation` |
| T.3: general transfer comparison and norm–residue | `general-transfer-comparison`, `general-milnor-norm-residue`, `complete-field-degree-one-norm`, `finite-complete-norm-residue`, `finite-normalization-completion-splitting` | General proof in `milnor-quillen-transfer-comparison`; `T.4/prime-degree-residue-on-generated-symbols`, `T.4/complete-norm-residue` |
| T.3: mixed inseparable normalization | Own node `T.4/mixed-function-field-normalization`, with `T.4/finite-artin-norm-base-change` | Request to AlgebraicCurves Layer 2 (owner of finite normalization), carrying the pure-first normal-hull argument |
| T.3: local and Chern signs | `T.7/chern-product-sign` | `T.7/local-comparison` (cubic test over ℚ₇), `T.7/chern-class-agreement` |

Main's versions are kept, for four reasons:

1. **One plan per result.** Keeping both would plan each of these theorems twice (PROTOCOL section 15).
2. **Main's are the later, dedicated rounds.** Their independent reviews, REV-FIX-RT-BP-ArithmeticKTheory--N.7~2
   (#5714) and REV-FIX-RT-BP-K2SymbolsBrauer--T.3~2 (#5722), are queued against those texts.
3. **No dangling references.** None of the branch's K.1, K.6 and T.1 nodes cites any dropped node (checked by id), so
   the rest of the branch merges unchanged.
4. **Main's N.7 elaborates.** Its suggested file passes `lean-check`.

The dropped alternatives remain on the branch at commit `52d782e2`.

**What the choice costs.** Main's ℚ(√5) proof goes through Zhang–Xu, whose construction of small residue generators
rests on Skalba's generalised Thue theorem. That theorem is a recorded source gap. The branch's direct route needs no
Skalba: it uses finite certificates checked by the standard-library script printed in its N.7 reader. It is the natural
way to close that gap if Skalba's paper stays unobtainable, and is recorded here for the N.7 reviewer and the maintainer.

**Carried over from the branch's N.7 and T.3 into main's.** Each was re-read at its locator on 6 October:

- **T.3 source issue `K2SymbolsBrauer/E13`.** Gille–Szamuely (first edition, p. 197, Lemma 7.3.6) define the base-change
  multiplicity e_j as the nilpotence index of the maximal ideal, but the norm formula needs the composition length.
  - Example: for k = 𝔽_p(s,t) and K = L = k(s^{1/p}, t^{1/p}), the algebra K ⊗_k K ≅ K[X,Y]/((X−a)^p, (Y−b)^p) has length
    p² and nilpotence index 2p − 1. In degree zero the two routes of the lemma's diagram give p² and 2p − 1.
  - Neither of the authors' errata lists (first and second edition, both read in full) corrects it.
  - Main's T.3 proof already uses lengths, so only the record was missing.
- **T.3 upstream note to ClassFieldTheory Layer 6.** Milne, CFT v4.03, III Proposition 3.6 states
  χ(φ_{L/K}(a)) = inv_K(a ∪ δχ) and gives no proof ("See Serre 1962, 'Annexe' to Chapter XI").
  - `T.7/local-comparison` uses this identity.
  - Its proof step and sources now say so, and the note asks the layer that defines the local Artin map to export the
    identity with its proof.
- **N.7 excerpt lengths.** Three excerpts exceeded the 300-character limit of PROTOCOL section 5. The branch had cut
  two of them mid-sentence. Now all three, including main's new Browkin excerpt, are split at sentence boundaries into
  separate source entries, with the reader updated to match.

## Corrections made while merging

1. **T.3 now cites K.1's nodes instead of requesting stages.** The branch's K.1 packet contains the early K.3 nodes that
   main's T.3 was requesting as contracts. Each was checked to match exactly, including the orientation ∂[s] = [R/sR] and
   the right-module convention giving ∂{π, u} = ū.
   - `T.3/localization-boundary` cites `K.3/localization-degree-one-index`, `K.3/dvr-degree-one-boundary` and
     `K.3/localization-product-boundary`. It no longer cites the K.3 stage.
   - `T.3/milnor-quillen-transfer-comparison` cites `K.3/finite-field-transfer-base-change`, which proves the
     base-change formula with local lengths on finite vector spaces, never as K(B) of the nonreduced algebra.
   - The K.3 request is narrowed to what K.1 still lacks: the identification of the torsion Serre quotient for a
     Dedekind domain. It is now needed only by `T.3/dedekind-localization-boundary`, which now lists the K.3 stage as a
     prerequisite. The coverage `remaining` item of T.3:localization-comparison that asked for these contracts says
     the same.
   - The K.7 request is narrowed to the unit-product contract a·b = {a, b}. It now also names
     `T.7/chern-class-agreement`, which cited the K.7 stage without any request.
2. **The V.5–N.8 stage cycle is removed.** `K3BlochGroups:V.5/k3-Z-and-Q` and `V.5/k3-gaussian` imported the stage
   ArithmeticKTheory:N.8, while N.8's `k-groups-of-the-integers` and `gaussian-and-imaginary-quadratic` import V.5. N.8's
   packet already assigns K₃(ℤ) and K₃(ℚ(i)) to V.5. The branch had only proposed a hand-off; K3BlochGroups is a
   deliverable here, so the fix is applied.
   - V.5 now derives K₃(ℚ) ≅ ℤ/48 (r₁ = 1, r₂ = 0, w₂ = 24) and K₃(ℚ(i)) ≅ ℤ ⊕ ℤ/24 (r₂ = 1, w₂ = 24) from its own
     `V.5/k3-number-field`, on ArithmeticKTheory N.5's degree-three rows. It gets K₃(ℤ) ≅ K₃(ℚ) from N.5's localisation
     theorem, citing K-book Corollary VI.5.3 and Example VI.2.1.2.
   - Its request to N.8 is removed. The ownership restructure entry, the coverage note and the reader say that V.5 owns
     these values and N.8 imports them.
   - N.5 imports neither N.8 nor V.5 (checked), so no new cycle arises.
3. **Readers synchronised.**
   - N.7: its nine N.7-stage sections still showed superseded text, such as Iwasawa's criterion without the cyclotomic
     tower and Bernoulli formulas without the k ↦ 2k re-indexing. They were regenerated from the packet in the format of
     its N.8 sections; the same renderer reproduces the eleven N.8 sections exactly, up to a section separator. Its
     IntegralIwasawaTheory L3 request also had an older paraphrase and now carries the packet's text.
   - N.1: `rank-filtration` lacked review correction C1 (m ≥ 1 for the strata; Q₀ equivalent to the terminal category).
     It was regenerated in the reader's field format, which reproduces the other N.1 sections.
   - All seven readers now contain every node statement, hypothesis, proof step, acceptance item, API and test
     statement, gap and request need of their packet. The check normalises whitespace and treats `\|` in tables as `|`.
4. **Suggested Lean files.**
   - **T.1** had six elaboration errors and a lint warning:
     - `(by decide)` proofs of 3 ≤ 3 that unification had already solved ("No goals");
     - `decide` on `(ComplexShape.down ℕ).next 2 = 1`, which does not reduce; `ChainComplex.next_nat_succ` replaces it;
     - the duplicated namespace in `TauCeti.Steinberg.Steinberg`, now silenced locally.

     It now elaborates.
   - **K.1** had a module docstring before its imports, which Lean rejects; the imports now come first.
   - **K.6** declared nothing: every signature was a comment. It now states as Lean declarations, over Mathlib, the
     objects that have carriers:
     - Karoubi's flasqueness data `IsFlasqueRing` and `coneRing`;
     - the Nil category `NilCat`, with its morphisms, category instance, `NilCat.forget`, `NilCat.zero` and
       `NilCat.forget_obj_zero`;
     - `FiniteChainDomination` with `transport`, `fg` and the test `self`, which is constructed without `sorry`.

     The tests `cone_ring_flasque`, `nilpotent_required` (its endomorphism half) and `contractible_domination` are
     `example`s. The rest stay comments naming their supplier.
   - **Name coverage.** In five files, 123 packet API and test names had no occurrence on main: 95 in T.1, 15 in N.7,
     7 in N.1, 4 in K3BlochGroups, 2 in T.3. Each is now listed with its packet statement in a closing comment block, so
     that file and packet agree on names as section 13 asks.
5. **Coverage entries of K.1 and K.6.** The branch had replaced each stage's descriptive note with a node count and
   dropped two genuine `remaining` items. Main's notes are restored, each followed by a sentence naming the nodes this
   round adds there and any proposed new parents. The two items are restored: the unapplied K.3:cofinality stage, and
   the realisation theorem still requested from StableHomotopyKTheory H.2. K.2:low-degree-comparisons, whose nodes this
   round leaves unchanged, is back to main's `source_decomposed`.
6. **Review objects.** The branch had moved the last independent verdicts of K.1, K.6 and T.1 into `reviewHistory`, set
   `review` to `pending`, and added a nonstandard `revision` key. Main's convention is that the fixer leaves `review` to
   the next reviewer, so all three are restored to main's `review` and `reviewHistory`.

## Deliverables and validation

| Packet | Nodes | API items | Unit tests | Gaps | Requests | Status | Suggested file |
| --- | ---: | ---: | ---: | ---: | ---: | --- | --- |
| [ArithmeticKTheory N.1](../packets/ArithmeticKTheory--N.1.json) | 56 | 75 | 60 | 7 | 25 | partial | not compiled (Tau Ceti imports) |
| [GeneralAlgebraicKTheory K.1](../packets/GeneralAlgebraicKTheory--K.1.json) | 83 | 122 | 83 | 1 | 22 | partial | not compiled (Tau Ceti imports) |
| [K2SymbolsBrauer T.3](../packets/K2SymbolsBrauer--T.3.json) | 68 | 124 | 77 | 4 | 32 | partial | not compiled (Tau Ceti imports) |
| [ArithmeticKTheory N.7](../packets/ArithmeticKTheory--N.7.json) | 20 | 34 | 25 | 3 | 10 | complete | elaborates, 36 `sorry` warnings only |
| [GeneralAlgebraicKTheory K.6](../packets/GeneralAlgebraicKTheory--K.6.json) | 73 | 124 | 83 | 2 | 18 | partial | elaborates, 6 `sorry` warnings only |
| [K2SymbolsBrauer T.1](../packets/K2SymbolsBrauer--T.1.json) | 66 | 107 | 73 | 18 | 6 | partial | elaborates, 68 `sorry` warnings only |
| [K3BlochGroups](../packets/K3BlochGroups.json) | 101 | 212 | 132 | 24 | 27 | partial | elaborates, 423 `sorry` warnings only |

API items and unit tests are counted over all nodes. Against main, the branch adds 90 nodes:

- 46 to K.1;
- 40 to K.6;
- 4 to T.1.

## Finding-by-finding dispositions

Every number denotes `RT-AREA-ktheory-1/<number>`. A hand-off follows PROTOCOL section 17: the named blueprint job owns
the missing plan, and a hand-off does not certify its proofs. Their destination packets now exist on main, and the next
section reports whether each carries its finding.

| Finding | Applied repair or concrete supplier handoff |
| --- | --- |
| 1 | Preserve N.3's decomposed rank filtration, comma categories, suspended buildings and finite-generation spectral sequence, with C1's rank-zero correction (now also in the reader). [Borel #74](https://github.com/CBirkbeck/tauceti-explorer/issues/74), R.1, supplies integral arithmetic-group finiteness with `Steinberg ⊗ ℤχ^(n−1)` and `χ = Norm(det)`, for all finite-index arithmetic groups of the relevant projective modules, not only the free case. |
| 2 | [M.1 #957](https://github.com/CBirkbeck/tauceti-explorer/issues/957) and [M.5d #959](https://github.com/CBirkbeck/tauceti-explorer/issues/959) own Beilinson–Lichtenbaum: derived truncation over fields, naturality and coefficients, then smooth-scheme and Dedekind variants with their actual topology hypotheses. A Dedekind base is not silently reduced to the smooth-over-a-field theorem. |
| 3 | Preserve N.5's imported real/complex comparison. #959 supplies real Suslin comparison in positive degrees using KO, and complex comparison using KU; topological real K-theory is RT.4's supplier. The dyadic degree-zero exception is not included in the positive-degree theorem. |
| 4 | K.1 decomposes objectwise S-additivity, pushout comparison, relative-S paths and the zero augmentation, iteration, double-swallow and S/Q comparison. K.6 supplies the biexact S-grid, latching-cofibration proof, stabilization and coherence. K.4:construction and proposed K.7:products precede their consumers; [H #999](https://github.com/CBirkbeck/tauceti-explorer/issues/999) assembles the spectrum and supplies generic smash/realization facts. |
| 5 | Correct the handoff to #999: H.3 owns plus/simple-CW and local-coefficient Whitehead inputs; **H.6**, not H.3, owns rational Hurewicz. #74 imports that H.6 theorem. Connectedness, simple action and finite-type conditions are part of the contracts. |
| 6 | #74 R.5 supplies the arithmetic quotient input for the specified inner forms split at infinity, and sufficient nonzero rational volume with the chosen measures. No general Tamagawa-number assertion replaces the narrower theorem needed by the finiteness argument. |
| 7 | Preserve N.3's S-integer higher-degree rank range `≥2`; degree one uses S-unit rank. #74 R.3 must state the same separation when exporting orders/ranks to arithmetic K-theory. |
| 8 | M.3, in #957, remains the single owner of the general-field Galois symbol, its tensor-twist formula, Steinberg relation, and separate local/global/S-integer Tate theorems. T.7 imports it and compares conventions; N.6 and downstream local-field/Birch–Tate consumers import Tate's theorem from M.3. |
| 9 | N.6 (N.1 packet) keeps sole ownership of the order-certificate engine, with upper generation and an independent lower bound; N.8 instantiates it. T.5 proves the K₂(ℤ) upper bound by Milnor §10 (main's #6702): `T.5/integer-steinberg-word-model`, `T.5/silvester-word-reduction`, `T.5/integer-kernel-in-monomial-subgroup`, `T.5/integer-kernel-upper-generation`; the real sign symbol gives the independent lower bound. K₂(ℚ) follows from the tame sequence; elementary finite-field K₂ is T.2's. [U.1 #764](https://github.com/CBirkbeck/tauceti-explorer/issues/764) imports these results. The branch's second proof of the same bound (Tate's S-unit filtration in T.5) is not kept. |
| 10 | Preserve N.4's finite twisted `w₂`, with finite K₂ supplied independently by N.3. [Birch–Tate #998](https://github.com/CBirkbeck/tauceti-explorer/issues/998) imports those inputs before its order formula; it does not prove K₂ finiteness by assuming that formula. |
| 11 | N.8 (main's #6707): Tate's method (`N.8/tate-norm-filtration`, `N.8/tate-criterion`), K₂(ℤ[i]) = 0 (`N.8/gaussian-tame-kernel-vanishes`), Zhang–Xu's K₂(ℤ[ζ₅]) = 0 (`N.8/tame-kernel-of-q-zeta-five`), and upper generation for ℚ(√5) by restriction to ℚ(ζ₅), transfer and Tate's two-torsion theorem (`N.8/real-quadratic-upper-generation`). The two real sign characters give the lower bound four, so `N.8/real-quadratic-example-and-birch-tate` is a complete certificate, exported to #998 B.3, which supplies neither bound. Zhang–Xu's construction of small generators rests on Skalba's generalised Thue theorem, a recorded gap; the branch's Skalba-free direct route is noted above. |
| 12 | T.4 (main's #6702): finite normalization for every finite K/k(t), separable or not, is imported from AlgebraicCurves Layer 2, whose request carries the pure-first normal-hull argument. The all-degree Milnor norm–residue square is decomposed from Gille–Szamuely §7.4 (`T.4/prime-degree-residue-on-generated-symbols`, `T.4/kato-complete-residue`, `T.4/complete-norm-residue`, `T.3/transfer-and-norm-residue`). The generic DVR norm and length identities are requested from LocalFieldsRamification Layer 3. Proper regular, possibly nonsmooth, models remain explicit. #957 M.4 imports the all-field norms and reciprocity; AC12 supplies the point/place dictionary. |
| 13 | #959 M.5d owns Bloch–Gabber–Kato over imperfect fields, with early differential/Cartier inputs. Mod-p `1−C⁻¹` and prime-power logarithmic Witt constructions are separate obligations. No perfect-field shortcut is added here. |
| 14 | #957 M.1/M.3 supplies early Kummer theory, cup products and `μ_m ⊗ μ_m`; multiplication of roots of unity is not used as a purported bilinear tensor pairing. T.7's formulas contract the tensor twist using the chosen primitive root. |
| 15 | K.1's relative-S model includes the canonical path for a zero source, with the correct zero augmentation; the iterated argument is decomposed. #999 H.2 supplies good/proper simplicial realization, connectedness and the comparison from the specified simplicial fibres to the canonical homotopy fibre. |
| 16 | #999 H.5 owns chain-level Eilenberg–Mac Lane/HR spectra, their module comparison, grading, truncation and representability as separate statements. K.1/K.6 import those interfaces instead of declaring them supplied by the bare existence of spectra. |
| 17 | K.6 adds the noncommutative right-module projective-line proof: opposite-ring charts, finite-clearing regularity, canonical resolution, twists, quotient models, actual resolution-fibre contraction, directed lattices and Nil localization. The whole Nil functor map and the `MR` matrices are explicit. [Scheme K #987](https://github.com/CBirkbeck/tauceti-explorer/issues/987), S.2/S.5, imports this ring argument before its scheme specialization. |
| 18 | K.1 supplies the relative-triples/π₀ comparison, stable five-term sequence, Milnor patching and degree-zero ideal excision. K.5 retains all four interior exact positions. K.6's negative Bass statement remains separate. U.6 owns positive comparisons: henselian relative fibres are 1-connective; the generally stated birelative input is only 0-connective unless the additional π₁ surjectivity is established. |
| 19 | Preserve the early K.2 ring model and connective continuity. K.6/K.7 give unitization fibres, the complementary-idempotent extension for nonunital maps, matrix-corner Morita naturality and filtered stable-fibre continuity. Infinite corner matrices are a **nonunital** diagram. Scalar-extension maps on right modules keep their opposite-ring convention. |
| 20 | K.2:plus uses free/projective group-completion cofinality and the new early absolute degree-0/1 comparison, importing classical K₀/GL/E from U.1/U.2. The general exact-category cofinality proof is decomposed using the K₀-defined weak class and is proposed after K.4. No nonfree stably-free module is used as a degree-zero counterexample. |
| 21 | Preserve the pinned exact structure, finite-projective subcategory and ExactK0 reuse. K.1 decomposes extension base change, its actual cartesian direction, localized fibres, one-step/bounded resolution, dévissage contractions and Serre localization. Bühler supplies the cokernel/3×3 exact-category route; Quillen's expressly omitted embedding details are not claimed read as a proof. |
| 22 | #999 H.1/H.2/H.3 supplies nerves, covering/local-system comparisons and homotopy realization. The comparison with the twisted Serre spectral sequence uses AT8; an AT5 constant-coefficient homology theorem alone is insufficient. |
| 23 | #999 H.6 is the single owner of general exact couples and spectral-sequence infrastructure. #987 S.4 imports it and supplies geometric filtration/convergence inputs; it does not replan a scheme-specific general spectral-sequence construction. |
| 24 | #764 U.4 owns S-unit rank, the finite-index subgroup argument and the exceptional rank-one cases in SK₁. These are not swallowed by a stable higher-rank assertion. |
| 25 | #764 U.4 retains the verifier's **number-field** Bass–Milnor–Serre scope, using CFT12, Chebotarev10 and CA1 reciprocity. A function-field theorem cannot be inferred from this argument without its own source and hypotheses. |
| 26 | T.3/dedekind-localization-boundary and T.5 distinguish outside-S tame-kernel residues from the in-S relative sequence; surjectivity imports U.4's SK₁ theorem. The degree-one boundary is K.1's early `K.3/localization-degree-one-index` (∂[α] = [coker α] − [ker α]) and `K.3/dvr-degree-one-boundary` (∂[π] = 1), and the right module action is `K.3/localization-product-boundary`; `T.3/localization-boundary` now cites these nodes directly. This removes the S.3 normalization cycle. |
| 27 | T.7 (main's #6702): `T.7/local-comparison` gives (a,b)_F = ζ^(−e_m(inv β_ζ{a,b})) for the packet's arithmetic-Frobenius symbol, from Milne III.3.6 and III.4 by skew symmetry. The cubic test over ℚ₇ (m = 3, ζ ≡ 2) detects the sign that m = 2 cannot. Milne gives no proof of III.3.6, so the identity is now an upstream note to ClassFieldTheory Layer 6. `T.7/chern-class-agreement` gives c₂,₂ = −h from Soulé's thesis Proposition 2.2.2.3, with M.3 owning both maps. CFT 5/6/10/14, QFI 6E/7B and CA.1 keep their roles; exponent coordinates use `(ℚ/ℤ)[m] ≃ ℤ/m`. |
| 28 | Elementary residues and Milnor norms precede the Quillen comparison. `T.3/milnor-quillen-transfer-comparison` has a general proof: prime-to-p closure, degree-p symbol generation, a common base-change formula with local lengths, and Bézout. Its Quillen base-change input is now K.1's `K.3/finite-field-transfer-base-change`. PR #5300's trivial-valuation constant-extension case is retained, and finite-extension residue scope is not confused with arbitrary constant base change. Source issue E13 records the length-versus-nilpotence error in Gille–Szamuely. |
| 29 | Preserve the accepted K3BlochGroups repair: V.1 imports T.1's UCE/perfectness results, with no duplicate UCE construction, and keeps the plus-fibre/Hurewicz comparison. This does not certify unrelated T.1 supplier gaps or K3BlochGroups source gaps. |
| 30 | T.1 adds the kernel relative-bar complex, the chain-level `H₁ ≅ N/[E,N]` identification, the pinned ShortExact homology boundary, and naturality with the actual group-homology map (`T.1:classical/quotient-bar-kernel`, `…-h1`, `hochschild-serre-integral-five-term`, `hochschild-serre-five-term-natural`). No freeness assumption on N is inserted. The Hopf formula and its natural map use that construction, replacing both former Hopf gaps. #999 retains the distinct topological plus/Hurewicz obligation. |
| 31 | Preserve the reviewed source correction: the doubled affine **plane** gives vector-bundle K₀ = ℤ and perfect K₀ = G₀ = ℤ²; the doubled affine line is not this example. [Z.3 #765](https://github.com/CBirkbeck/tauceti-explorer/issues/765) imports the corrected example and its source discrepancy. |
| 32 | `T.4/weil-reciprocity` imports AC12's regular point/place dictionary and AlgebraicCurves Layer 2's finite normalization, and proves the adapter for EC2's disjoint-support evaluations; it duplicates neither upstream construction. The curve example keeps the equal normed evaluations 81/25 and the uniformizer-last sign. |
| 33 | **Corrected handoff:** #999 H.6 alone owns rational Hurewicz/Cartan–Serre/Milnor–Moore, with connected CW, homotopy associativity and the finite-type qualifications needed for cohomological duals. #74 R.3 imports it. The older raw /5 assignment to H.3 does not override the verifier's H.6 correction. |
| 34 | #74 R.4 imports S.6 algebraic Adams operations together with RT.4's comparison to **topological** Adams operations, before identifying the Borel eigenspaces. |
| 35 | #74 R.2 imports the early characteristic-zero Betti/de Rham/Lie quotient comparison from ALS.5. It does not wait for a downstream AS.5 result, and no existing algebraic-groups roadmap is replanned here. |
| 36 | #74 owns the all-weight Burgos normalization `Bo = 2 Be`; the determinant factor is `2^d`. A weight-two Bloch–Wigner check is a test, not a proof of the all-weight statement. |
| 37 | [Finite/local #763](https://github.com/CBirkbeck/tauceti-explorer/issues/763) retains Green's embedding/choice-of-root and induction/restriction interfaces, RT.4's Atiyah–Segal/Adams input, `K⁻¹(BG) = 0` and the simple-space Whitehead hypothesis. These imports precede the finite-field calculation. |
| 39 | #763 L.5 imports the general log-Witt construction before the DVR specialization and TR comparison; CR4/5 precede CR6's Hyodo–Kato comparison. Odd p and ℤ_(p)-algebra scope are preserved, and actual model comparisons are supplied. |

The rejected /38 is unchanged: the existing paths `CFT5 → T.7 → L.3` and `CFT5 → D.7 → M.7 → L.6` already provide the
ancestry.

## The hand-off destinations on 6 October

All nine destination packets now exist on main. Each was read on 6 October 2026 (a subagent's read, spot-checked
here) to see whether it carries what its finding requires. Of the 37 (finding, packet) pairs:

- 26 are carried;
- 7 are carried in part;
- 4 are not carried.

The misses are for those jobs' revision rounds and reviews, which the hand-off issues already bind; none is a
deliverable here.

- **Not carried: /5 and /33 (H.6 as single owner of rational Hurewicz / Cartan–Serre).**
  - `StableHomotopyKTheory:H.3/rational-hurewicz-hspace` owns it, for path-connected H-spaces of finite type without the
    homotopy-associativity hypothesis the verifier required, and no H.6 node covers it.
  - `BorelRegulators:R.3/cartan-serre-application`, `R.3/gl-sl-primitive-comparison` and
    `R.1/finite-type-plus-consequences` import the H.3 stage.
  - Both packets are `complete` with `needs_changes` reviews.
- **Not carried: /23 in SchemeKTheoryOperations.** `S.4/k-coniveau-spectral-sequence` and
  `S.4/g-coniveau-spectral-sequence` build their own exact couples and do not import H.6's `H.6/exact-couple` and
  `H.6/filtered-spectrum-spectral-sequence`. The packet (`partial`, unreviewed) predates the hand-off; #987 is still
  available.
- **Partly carried:**
  - **/17, SchemeKTheoryOperations.** S.5 cites the K.6 stage, but never `K.6/projective-line-splitting`,
    `K.6/nil-groups-are-NK` or `K.6/fundamental-theorem-with-nil-terms`, and `S.5/projective-line-k-theory` re-derives
    P¹.
  - **/2, M.1 and M.5d.** Naturality is missing. The Dedekind form states only the a ≤ j isomorphism, with no truncation
    form.
  - **/31, Z.3.** Perfect K₀ = G₀ = ℤ² for the doubled affine plane is only in `upstreamNotes`.
  - **/37, KTheoryFiniteLocalFields.** `L.1/quillen-fibration` imports `H.3/plus-construction-universal-property`
    rather than the H-space Whitehead nodes, and does not prove BGL(𝔽_q)⁺ simple.
  - **/1, /7 and /35, BorelRegulators.** Carried with narrower forms:
    - /1: Aut_O(P) only, with the orientation twist handled by passing to a torsion-free subgroup;
    - /7: degree one is only said to be a distinct statement;
    - /35: it cites the ALS.5 stage through a request.
- **Carried**, among others:
  - /3, /13: M.5d (`M.7/suslin-real-comparison`, `M.5d/bloch-gabber-kato`);
  - /4, /15, /16, /22, /30: StableHomotopyKTheory H.1–H.5;
  - /6, /34, /36: BorelRegulators R.4–R.7;
  - /8, /12, /14: M.1, including `M.4/nesterenko-suslin-totaro`, which imports T.4;
  - /10 and /11: SpecialValuesBirchTate, whose `B.3/sqrt-five-birch-tate-check` imports
    `ArithmeticKTheory:N.8/real-quadratic-example-and-birch-tate`;
  - /24, /25: KTheoryLowDegrees U.4;
  - /39: KTheoryFiniteLocalFields L.5.

B.3 still calls N.8's upper bound a supplier gap; since #6707 it is a decomposed node of N.8 (with the Skalba source
gap), and B.3's next round should say so.

These packets' readiness also bears on this round's stage prerequisites. Many nodes of the seven packets still cite
supplier stages (H.2, H.5:spectra, M.3, S.3, …) that now have exact nodes in those packets. Replacing them is an
integration pass beyond this fix's findings, and the supplier packets are themselves unaccepted. It is left to the
packets' next rounds.

## Proof repairs that go beyond a renamed gap

### Waldhausen and Quillen models (K.1)

The K.1 additions specify the objectwise pushout behind S-additivity, the natural transformations through the
double-swallow, the relative path model and zero augmentation, and the edgewise S/Q comparison. Approximation uses the
iterated cylinder and finite-poset factorization data required by the proof, including the nonfunctorial factorization
variant; it is not asserted from an arbitrary functor's equivalence on objects.

Quillen resolution is split into the one-step comma-category contractions and the bounded-resolution filtration, with
kernels, pullbacks and the three resolution-dimension inequalities stated. Dévissage uses the actual intersection layers
`r = (M₀∩M′, M₁∩M′)` and `s = (M₀∩M′, M₁)` and the embedding of their quotient in `(M₁/M₀) ⊕ (M/M′)`, without assuming
extension closure of the dévissage subcategory. General cofinality uses the source's Grothendieck-class weak
equivalences after Waldhausen theory; early projective cofinality uses group completion. Quillen's plus = Q comparison
is decomposed through the extension category: its fibre products, cartesian lifts, the localised extension fibration and
the contractibility of the localised extension-action category.

The classical triple construction precedes the relative homotopy comparison. Its split additive relations, stable
boundary and five-term exact sequence are explicit. The π₀ comparison uses the early absolute ring K₀/K₁ adapter and the
actual automorphism path; it does not assume the later relative π₁ theorem. Degree-zero excision uses the patched module
and the split-augmentation Milnor square, rather than pretending that negative absolute exactness alone computes the
relative π₀ fibre. The early K.3 ring nodes (degree-one index, DVR boundary, right product action, transfer base change
with local lengths) are the ones T.3 now cites.

### Noncommutative projective line and negative K-theory (K.6)

All charts use right modules, hence the opposite-ring scalar extension, with the variable central. Eventual regularity
clears finitely many denominators; the canonical vector-bundle resolution and its twisted filtration are explicit.
Resolution fibres contract through `V ⊕ V₀`, not through the invalid pullback used before. Directed lattices are
enlarged as `V + I^(−n)K`. The whole Nil functor maps by `(t − ν, 1 − t⁻¹ν)`, whose finite geometric inverse gives the
required comparison before additivity.

The Frobenius graph factorization has middle object **B ⊕ I**, not A ⊕ I. Dense triangulated K₀ classes, roof
strictification, replacement categories, opposite approximation, nested weak-equivalence fibrations and the completion
spectrum are separate nodes. This route proves the all-integer spectrum localization theorem before using it for
comparisons.

The Karoubi cone uses countable sequences with finitely many object types, finitely many entry values and uniform
row/column bounds. Its index is a **graded relative triple with its transition map**, not the bare ungraded difference
of two projective classes. Cutoff changes are killed by the stated quasitrivial/elementary-shear relations. The four
negative-ring axioms determine the theory and its boundaries; uniqueness assumes matrix stability, while verifying that
axiom by nonunital continuity is a later, separate theorem. No equality `S(R[t]) = S(R)[t]` is claimed.

Finite-chain domination is distinct from a homotopy equivalence: `gf ≃ id` only makes `fg` a homotopy idempotent.
Ranicki's explicit block idempotent, alternating tail and Euler obstruction supply the finite model in the idempotent
completion. The restricted-completion return criterion, finite quotient lifts, complex mapping cylinder and
approximation then compare the additive cone with Frobenius IK. Keller's separate exact-versus-additive criterion
remains an explicitly unread auxiliary input (a gap). The finite Artin counterexample's K₃ input remains a precise
supplier request, and the older universal abelian-negative-vanishing claim is corrected using Neeman's counterexample.

### Arithmetic certificates, norms and signs (N.7 and T.3)

These are main's, and their reports give the full proofs and sources:
[N.7 round two](RT-BP-ArithmeticKTheory--N.7.fixes-2.md) and [T.3 round two](RT-BP-K2SymbolsBrauer--T.3.fixes-2.md).
This round adds three things to them:

- E13;
- the Milne III.3.6 note;
- the four K.1 node citations.

## Source reading and source discrepancies

Exact editions, URLs, hashes, read sections and proof limitations are in the packets and readers. The sources Codex read
for the kept K.1, K.6 and T.1 repairs are listed below.

- [Quillen, Higher algebraic K-theory I](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf),
  §2–5. All page images (PDF 15–32; publication pp. 99–116) were read. The embedding paragraph explicitly omits details,
  and the independent exact-category input is retained.
- [Waldhausen, Algebraic K-theory of spaces](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kspaces.pdf): the
  additivity, approximation, double-swallow and S/Q passages.
- [Thomason–Trobaugh](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/tt.pdf): cofinality, pp. 270–277.
- [Weibel, K-book](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf): II.2.10, Ex. 2.17, ideal excision and patching;
  IV low degrees, Ex. 1.15–16 and Ex. 7.9; V transfers, localization index and product signs, and the noncommutative
  projective-line proof.
- [Karoubi 1970](https://webusers.imj-prg.fr/~max.karoubi/Publications/07.pdf), §1–3, and
  [Karoubi 1971](https://webusers.imj-prg.fr/~max.karoubi/Publications/09.pdf).
- [Carlsson–Pedersen](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/carlped.pdf) and
  [Ranicki](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/finite.pdf), §1–3.
- [Schlichting, Negative K-theory of derived categories](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf).
- [Neeman, v2](https://arxiv.org/pdf/2006.16536v2), introduction, pp. 1–2.
- Weibel, *An introduction to homological algebra*, §6.8 (6.8.3, printed p. 196), and Löh's group-cohomology notes,
  for T.1's five-term sequence.

This session re-read, on 6 October 2026:

- **Gille–Szamuely, first edition**, author-hosted copy, SHA-256 `3697582f…1e63`: pp. 196–198 (PDF 210–212).
- **The authors' errata**:
  - [first edition](https://pagine.dm.unipi.it/tamas/erratams.pdf), SHA-256 `db7cea50…3d04`, read in full;
  - [second edition](https://pagine.dm.unipi.it/tamas/erratams2nd.pdf), SHA-256 `1f117717…2deb`, read in full.
- **Milne, CFT v4.03** ([PDF](https://www.jmilne.org/math/CourseNotes/CFT.pdf), SHA-256 `50d79af7…98f5`): III §3,
  Proposition 3.6 and its proof (p. 109), and Remark 4.5.
- **The K-book's Corollary VI.5.3 and Example VI.2.1.2**, as already excerpted in the K3BlochGroups packet, for the V.5
  derivation.

Source discrepancies recorded by this round, each in `sourceIssues` with locator, correction, check and the errata
searched:

1. **K.1 `E-extension-base-change-direction`.** In the K-book's extension-category proof (IV, Lemma 7.7), the
   base-change direction is reversed. The packet gives the correct pullback-arrow direction.
2. **K.6 `E-localisation-extension-quotient` and `E-resolution-fibre-contraction`.** The K-book's V.7.3 projective-line
   localization and resolution-fibre shortcuts omit the quotient and the genuine contraction data. The packet supplies
   them instead of the false pullback contraction.
3. **K.6 `E-frobenius-factorization-domain`.** Schlichting's 2003 preprint (Remark 11.2) gives the projection the
   domain A ⊕ I; it must be B ⊕ I.
4. **K.6 `E-fp-functors-cokernels`.** Schlichting's 2003 preprint (proof of Lemma 10.3) says representable functors are
   closed under cokernels and extensions; the statement holds for finitely presented functors.
5. **T.1 `E-central-subgroup-coefficients`.** The HA 6.8.4 central-subgroup formulation still needs trivial action on
   the coefficient module for its displayed trivial-action homology term. The C₂/ℤ sign-action case detects the
   omission.
6. **T.3 `K2SymbolsBrauer/E13`.** Gille–Szamuely's base-change multiplicity must be a length, as above.

## Stage integration and remaining supplier work

The packet `restructure` entries and `proposedParentStageId` fields are the integration instructions:

1. Early K.4:construction includes S-additivity and relative-S delooping; H.5:S-delooping assembles its spectrum. Drop
   the unused E5/H.5 prerequisites of early construction and import its actual H.2 realization input.
2. Early K.7:products contains **four** product-construction nodes; generic H.5 smash/module-boundary interfaces do not
   depend on K.3 localization. General cofinality moves to K.3:cofinality after K.4; early ring/free-projective
   comparison stays in K.2:plus.
3. K.2:plus's absolute π₀/π₁ adapter precedes K.5. The later K₂/relative-comparison aggregator is not an early K.3/K.5
   prerequisite. Negative-theory uniqueness assumes its four axioms; K.7 later verifies nonunital matrix continuity for
   the candidate.
4. T.2's transfer-torsion corollary moves to a separate `T.2:symbols:transfer-torsion` stage after early K.3 and
   connective continuity. The elementary Matsumoto stage stays early. T.2:graded-map imports K.7:products, not late K.7.
5. The V.5 reverse imports of N.8 are removed (correction 2 above), so the branch's proposed `N.8:K2-examples` split is
   no longer needed to break a cycle and is not carried into main's N.7.

These proposals matter. With them, the node graph of the seven packets (467 nodes) is acyclic and so is its stage
projection. Without them, using today's `parentStageId`, the projection still has a K.3 ↔ K.7 cycle; main had the
corresponding K.6 ↔ K.7 cycle and the V.5 ↔ N.8 cycle. The K.3 ↔ K.7 cycle disappears only when the maintainer applies
the proposed early K.7:products and K.3 parents.

## Checks

- `python3 scripts/check_blueprint.py` with the pinned declaration index (`TAUCETI_BASELINE` set to the shared
  baseline at Mathlib `082e2d37…` and Tau Ceti `f7904748…`): **0 errors, 0 warnings** on all seven packets.
- Cycle check over the seven packets, with and without the proposed parents: results as stated above.
- Reader agreement: every node statement, hypothesis, proof step, acceptance item, API and test statement, gap detail
  and request need of each packet occurs in its reader. N.7 and N.1 needed the regeneration described above.
- Name agreement: every API and test name of each packet occurs in its suggested file.
- `lean-check` (`lake env lean` in the shared build at the Mathlib pin) runs clean on N.7, K.6, T.1 and K3BlochGroups:
  no errors, and `sorry` the only warning (counts in the table).
- N.1, K.1 and T.3 were **not compiled**. Each imports a Tau Ceti module whose `.olean` the shared build does not have:
  N.1 and K.1 `TauCeti.Algebra.Category.ModuleCat.CartanMap` and `TauCeti.CategoryTheory.GrothendieckGroup.*`; T.3
  `TauCeti.FieldTheory.FunctionField.*`. `lean-check` stops at the first import. No Lake project, build, cache download
  or language server was used.
- `python3 research/blueprint/intake.py check-files` on the 21 changed files: 0 problems; only this issue's
  deliverables change. `git diff --check` is clean.
