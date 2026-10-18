# BP-PadicLocalLanglandsForGL2Qp — handoff

Refs #970. Claude (Opus 5.5), session `claude-oQ7sqq`, 18 October 2026; branch
`claude-oQ7sqq-bp-padic-llc-gl2`, input `a11f844ef`. The bot confirmed the claim
(comment 6256118854). This session claimed only this job.

## What was delivered

- `research/blueprint/packets/PadicLocalLanglandsForGL2Qp.json`: status `complete`, part `null`,
  scope R30.1–R30.6, **60 nodes** (14 definitions, 11 constructions, 32 theorems, 3 comparisons),
  170 API items, 100 unit tests, 26 planets (at most 6 per layer), 17 baseline declarations,
  11 requests, 4 gaps, 4 source issues, 3 restructure proposals. Every stage is `planned`.
  `scripts/check_blueprint.py` with the pinned declaration index: **0 errors, 0 warnings**.
  A Sonnet cross-check of all 121 (node, source, locator) triples against the downloaded texts found
  five wrong page numbers (Colmez II.1.13, Paškūnas 2016 Prop. 2.33, three Emerton lg pages) and one
  imprecise match text; each was verified by hand and corrected.
- `research/blueprint/readmes/PadicLocalLanglandsForGL2Qp.md`: the roadmap document, rendered from
  the packet with hand-written front matter (summary, scope and ownership, conventions, supplier
  contracts, layer introductions, required examples, gaps, requests, source issues, references).
- `research/blueprint/suggested/PadicLocalLanglandsForGL2Qp.lean`: 370 lines. **Compiled** with
  `lean-check` at Mathlib `082e2d3` / Tau Ceti `f790474`: exit 0, 20 warnings, all
  `declaration uses sorry`; no sorry'd data. It types the GL₂(ℚ_p) subgroups and elements, the
  characters x|x| and μ_λ, the smooth/admissible/locally admissible/locally finite predicates on
  `TopRep` (with Tau Ceti's `IsSmoothDiscrete`), central characters, the principal-series carrier,
  and the Breuil–Mézard weight dictionary. The closing comment lists, node by node, every packet
  target, API item and check whose carrier is not at the pins.

## Layer by layer

- **R30.1** imports PG.0–PG.2 (stage requests: that packet has not planned them yet) and PadicHodgeTheory
  P7; plans GL₂(ℚ_p) subgroups, Colmez's character dictionary (uniformisers ↦ geometric Frobenii,
  x|x| ↦ χ), the covariant Fontaine convention, the Tate dual (Colmez's φ(dT/(1+T)) = dT/(1+T)),
  ψ and D⁺ ⊂ D^♮ ⊂ D^♯, M ⊠ ℚ_p, R(δ), trianguline representations, and the bridge from Colmez's LL(M)
  to R16.3 (LL(M) = π with rec(π) ⊗ |·|^{1/2} ≅ M, except the reducible N = 0 case; V = MF(ε)).
- **R30.2** specialises SR.0 (Tau Ceti), ND.6 and ND.1–ND.2 (LocallyAnalyticDistributionsPartII);
  plans the torsion categories, Pontryagin duals, Ban^adm, Π^an/Π^alg, universal completions, mod p
  principal series, the Barthel–Livné–Breuil classification, mod ℓ irreducibles of GL₂(ℤ_ℓ), U₀(ℓ),
  Ũ₀(ℓ) (BCDT §1.3), and the F ≠ ℚ_p failures.
- **R30.3**: D ⊠_δ ℙ¹, the Montreal functor (D, V, V̌), values on irreducibles and Breuil's mod p
  correspondence, the contragredient, Π(D)/Π(V), Colmez's theorem (with footnote 7's residual cases:
  Böckle at p = 3, Chenevier at p = 2), the CDP bijection (all p), Ext¹ injectivity, Π(D)^an.
- **R30.4**: LL(V) ⊗ Alg(V), Colmez's locally algebraic vectors theorem, Berger–Breuil, Henniart's
  types, Kisin's Hypothesis (1.2.6), completions of π ⊗ W (weights do not determine Π), Kirillov
  models, trianguline locally analytic vectors, Dospinescu's de Rham extensions.
- **R30.5**: blocks and their classification (p = 2, 3 degenerations), projective envelopes with
  (H0)–(H5), R^{ps,δ}_B, Paškūnas's endomorphism rings (p ≥ 5; p = 2 generic blocks), Paškūnas–Tung
  local R = T (all p), Kisin's deformation comparison, Nakamura B.23–B.28, the Breuil–Mézard cycle
  identity and normalisation dictionary, Paškūnas's support criterion, CDN's Kisin rings, BCDT
  admittance and Conjecture 1.3.1(1).
- **R30.6**: Paškūnas 2015, Hu–Tan, Tung 2021a, Paškūnas 2016, Tung 2021b, Kisin's local inequality
  with Gee–Kisin B.1–B.2, Paškūnas–Tung finiteness, block occurrence (CDN Prop. 4.10 in local form),
  Breuil–Strauch (Dospinescu–Le Bras), and the hypothesis table read off Dieulefait–Pacetti
  Theorems 1.4–1.5.

## Red-team finding RT-AREA-automorphic-1/17

Handled as the finding asks: R30.2 constructs no second Banach category. The general owner is
LocallyAnalyticDistributionsPartII `ND.6/banach-iwasawa-duality` (accepted; Schikhof duality,
Schneider–Teitelbaum Lemma 3.4 / Theorem 3.5, abelianness for compact groups), which already sits
next to the Lazard input (NoncommutativeAndEquivariantIwasawa NE.0) that the finding pairs it with.
The compact-open admissibility test for locally compact G is **requested from ND.6**; R30.2/admissible-
unitary-banach specialises ND.6 to GL₂(ℚ_p). The fix records named PadicMeasuresIwasawaAlgebras L1
(round 1) and CompletedCohomologyPartII CC.0 (rounds 5–6); PMIA is now a Tau Ceti roadmap with no
Banach theory, so the first restructure proposal makes ND.6 the owner for CC.2/CC.5 as well.

## Added sources (issue list)

- Nakamura 2023: items /34 → R30.5/paskunas-cycle-criterion (Theorem 4.7); /57 →
  R30.5/kisin-deformation-comparison (B.17–B.22) and R30.3/montreal-functor; /58 →
  R30.5/dual-of-universal-deformation (B.24–B.25); /59 → same node (B.23, B.26); /60 →
  R30.5/removing-projective-envelope (B.27–B.28).
- CDN 2023: the R = T theorem is **Théorème 1.16** (p. 20; Théorème 0.17 in the introduction) — the
  issue's "Theorem 1.15" does not exist in arXiv v2 (Remarque 1.15 is the B ↔ ρ̄_B bijection) →
  R30.5/local-r-equals-t; Remarques 1.11, 1.13 (1.12 is a Proposition) → R30.5/blocks and
  blocks-classification; Proposition 4.10 → R30.6/block-occurrence (local form; the supercuspidal
  automorphic point is R31's); §1.2 → R30.2/modp-irreducibles; §1.3.1 → R30.3/pi-of-D.
- CDN 2020: LL(V) = Π(V)^lisse → R30.4/locally-algebraic-vectors; universal completion
  (Proposition 2.9, Corollaire 2.13) → R30.2/universal-unitary-completion.
- BCDT 2001: admits/simply admits → R30.5/admittance; Conjecture 1.3.1 → R30.5/bcdt-admittance-criterion
  (part (1) only; part (2) concerns acceptability, a patching notion); mod ℓ irreducibles →
  R30.2/mod-l-compact-irreducibles.

## Consumer requests answered

- GL2ModularityLifting R22.1 (to R30.6): Breuil–Mézard cycles → R30.6/paskunas-bm-scalar-endomorphisms,
  hu-tan-bm-split, tung-bm-p-odd (and p = 2 rows); Kisin's local inequality with Gee–Kisin B.1–B.2 →
  R30.6/kisin-local-inequality; Kisin's Hypothesis (1.2.6) → R30.4/kisin-hypothesis.
- LocalGaloisDeformationRings (to R30.5): R^{ps,δ}_B → R30.5/block-pseudodeformation-ring; CDN's rings
  R_{B,M} (Théorème 0.1 of the Kisin-rings paper; 5.11 in their numbering) → R30.5/kisin-ring-from-langlands.
- LocallyAnalyticCompletedCohomology (to R30.4, R30.6): Kirillov model → R30.4/kirillov-model (Colmez
  VI.5.6–VI.5.12; Pan's Theorem 6.4.3 form not read); CDP bijection → R30.3/cdp-correspondence;
  crystalline principal series locally analytic vectors and Breuil's ℒ-extensions →
  R30.4/trianguline-analytic-vectors (Colmez 2014; Liu–Xie–Zhang not read); Paškūnas–Tung υ and
  finiteness → R30.5/local-r-equals-t, R30.6/paskunas-tung-finiteness; Breuil–Strauch → R30.6/breuil-strauch.
  Those consumers should point their stage prerequisites at these node ids (coverage remaining items).

## Moves and ownership notes (for the tier order)

No notion was moved down into this roadmap from a higher one. Two tier roadmaps cite this one upward
(LocalGaloisDeformationRings once, GL2ModularityLifting seven times): restructure proposals 2–3 say
which nodes they should name, that R^{ps,δ}_B is Galois-side and can move down into
LocalGaloisDeformationRings, and that the GL₂(ℚ_p)-side theorems should enter those packages as
explicit named inputs. The Henniart types node lives in R30.4 (not R30.5) so that R30.4/kisin-hypothesis
does not depend on a later layer.

## Gaps (precise)

- **G1** — supercuspidal case of Π(V)^alg = LL(V) ⊗ Alg(V): only Emerton's global proof (lg §7.4);
  CDP footnote 5 and CDN-Kisin Remarque 0.2(v) confirm. Citing R31/Serre weights would create a stage
  cycle, so it is a gap; consumers needing supercuspidal types inherit it.
- **G2** — p = 2 for R(δ) and the trianguline parameter space (Colmez's trianguline paper assumes
  p ≠ 2; Kedlaya–Pottharst–Xiao not read).
- **G3** — matching BCDT's explicit admittance with nonvanishing of the cycles C_σ beyond p ≥ 5,
  End ρ̄ = k.
- **G4** — Emerton's induction/weight conventions (π_p(V), MF table, det^{b+1} vs det^b) against
  Colmez's LL and V.

## Source issues recorded (all new; reviewers to confirm)

E1 Paškūnas 2016 Theorem 2.37 says "inequalities" but displays equalities; E2 Paškūnas 2016 §2.C
requires determinant ψ where ψε is meant; E3 Emerton lg Theorem 3.3.22 has det^{b+1}, its proof (§7.4)
det^b; E4 CDP p. 2 cites Emerton "th. 3.2.22" for Theorem 3.3.22.

## Sources

Read (public; URLs, versions and SHA-256 in the packet): Colmez 2010 (author's kirilov.pdf), Colmez 2008
(trianguline), Colmez 2014 (locan), Paškūnas 2013, 2014 (blocks), 2015, 2016, Paškūnas–Tung, CDP, CDN
2020, 2023 and Kisin rings, Colmez–Dospinescu, Dospinescu, Berger–Breuil, Emerton lg, Gee–Kisin
(Appendix B), Kisin 2009 (author's DVI preprint read through a text extraction: formulas partly garbled,
preprint pages cited), Nakamura (arXiv pages), Dospinescu–Le Bras, Breuil 2003, BCDT (Breuil's author
copy), Hu–Tan, Tung 2021a/b, Dieulefait–Pacetti. Not read: Kisin's Astérisque 330 article (its theorem is
cited through Emerton 3.3.13 and Nakamura B.20), Barthel–Livné (through FiniteFlat R07.5, Colmez and
CDN), Henniart's appendix to Breuil–Mézard (through Paškūnas 2015 and Kisin), Liu–Xie–Zhang, Pan,
Kedlaya–Pottharst–Xiao, Böckle (mod 3), the published versions where only arXiv was read. No source text
is in the repository.

## Where to resume

The review job. Follow-ups after acceptance: the coverage `remaining` lists (PG.0–PG.2 node ids once that
packet plans them; ND.6/ND.2 requests; G1–G4; consumer re-pointing in GL2ModularityLifting R22.1,
LocalGaloisDeformationRings R08.3 and LocallyAnalyticCompletedCohomology LA.5/LA.12).
