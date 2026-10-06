# REV-HilbertModularVarietiesAndShimuraCurves--R18.2

Accepted after corrections on 6 October 2026. Reviewer: Claude, session
claude-Czpok2, issue #431. The packet, reader document and suggested file were
written by Codex, session codex-rIRSNc (issue #754, PR #6758). This reviewer
wrote none of them.

This accepts a complete target-level planning pass (PROTOCOL sections 0 and 2)
of stages R18.2–R18.6. The roadmap's distance is 8, so target level is the
correct granularity. R18.2–R18.5 stay **planned**, each with a precise
`remaining` list. R18.6 stays **source_decomposed**: under the accepted RS-23
and the reviewed audit it is an export index with no nodes. Every
implementation status remains `unchecked`. The per-node evidence is in the
packet's `review.checked`: 25 nodes verified, 33 corrected, none added, none
unverifiable. Most corrections are to citations.

| Measure | Input | Reviewed |
| --- | ---: | ---: |
| Nodes (definitions / constructions / theorems / comparisons) | 58 (4 / 12 / 28 / 14) | 58 (4 / 12 / 28 / 14) |
| API items | 64 | 65 |
| Unit tests | 49 | 49 (one reworded) |
| Planets (R18.2 / R18.3 / R18.4 / R18.5) | 6 / 6 / 4 / 5 | 6 / 6 / 4 / 5 (one renamed) |
| Pinned baseline declarations | 16 | 16, all confirmed |
| Supplier requests / gaps | 38 / 6 | 38 (two sharpened) / 6 |
| Source issues | 19 | 19, all confirmed |
| Restructure proposals | 5 | 7 |
| Planned / closed stages | 4 / 0 | 4 / 0 |

`python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings. An
errata-v1 projection of `sourceIssues` with `sourceVersions` passes
`scripts/check_errata.py`. `lean-check` elaborates the revised suggested file
in the shared build at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, with
`sorry` as its only warning (33 occurrences). The file imports only Mathlib
modules. The shared build's Tau Ceti checkout is off the pin, so Tau Ceti
declarations were read with `git show f790474821cf4256814db967cb154e7af3d0c369:<path>`.

## What was read

All nine sources were downloaded, and every SHA-256 matches the packet. Text
was extracted with `pdftotext`. Formulas that the OCR garbles were checked on
rendered page images: YZ pp.563 and 573, BC pp.107, 108 and 146.

| Source | Passages checked |
| --- | --- |
| [Carayol, Compositio 59 (1986)](https://www.numdam.org/item/CM_1986__59_2_151_0.pdf) | §0.1–0.6 (pp.151–153: d > 1, a place where B splits, good reduction for small H), §1.4 (pp.159–160: freeness lemmas and the p-divisible group E_n), §9.1–9.4 (pp.206–209) |
| [Yuan–Zhang, Annals 187 (2018)](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) | §1.2–1.3 (pp.536–539), §2.3 (p.549), §3.1–3.3 (pp.550–559), §4.1–4.3 (pp.561–570), §5.1–5.3 (pp.571–577), §7.2 (p.591), §8.3 (pp.619–620) |
| [Yuan–Zhang erratum, author revision](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf) | §1, Theorems 1–2 |
| [Boutot–Carayol, Astérisque 196–197](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf) | Part II §8 (Definitions 8.1, 8.3; Theorems 8.2, 8.4, pp.107–108); Part III §§5.2–5.5 (pp.140–146). The PDF page is the printed page plus 5. |
| [Boutot–Zink, arXiv:2212.06886v1](https://arxiv.org/pdf/2212.06886v1) | §1 (pp.1–3: Γ_g, the descent diagram), (5.18)–(5.20) and Proposition 5.9, (6.28)–(6.31), Theorem 6.7 and Corollary 6.8 (pp.45–50) |
| [Khare–Wintenberger II, author copy](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | §7 in full (pp.57–67), §8.2 (p.73), §8.4 (p.77). In this copy the PDF page equals the printed page. |
| [Taylor, Documenta Coates volume](https://ems.press/content/book-chapter-files/27484?nt=1) | §1, pp.737–742: Lemma 1.1, Corollary 1.2, the coefficient pairing, the adjoint formula |
| [Colmez–Dospinescu–Nizioł 2020, arXiv v2](https://arxiv.org/pdf/1704.08928v2) | §1.2 (pp.12–13), §5.2.1–5.2.2 (pp.40–43, Proposition 5.2 and Proposition 5.4) |
| [Colmez–Dospinescu–Nizioł 2023, arXiv v2](https://arxiv.org/pdf/2204.11214) | §4.1.1–4.1.3 (pp.47–49) |

I also tried to collate Khare's Lemma 2.2 (gap 3). The arXiv version
math/0504080v1 has Propositions 2.1–2.2 and no Lemma 2.2. Project Euclid
refuses scripted access, and Khare's UCLA directory has no copy. The gap
therefore stands as recorded.

A normalising script compared every excerpt with the extracted text. It
flagged the citations listed under "Corrections". The remaining misses were
OCR artefacts (primes rendered as 0), confirmed by hand.

## Baseline

All 16 citations were read at the pinned commits. Each declaration exists
under its name and provides what its citing nodes use.

- `DoubleCoset.Quotient` and `DoubleCoset.eq` (`b = h * a * k`) in
  `Mathlib/GroupTheory/DoubleCoset.lean`. These are the class-set carrier, and
  the suggested file instantiates them with a right subgroup `R = UZ`.
- `Representation`, `Submodule`, `MonoidAlgebra`, `QuotientGroup.mk`,
  `Module.Free`, `Module.Finite` and `LinearEquiv`, used as generic carriers
  only.
- `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.Flat` and
  `IsRegularLocalRing` (`spanFinrank (maximalIdeal R) = ringKrullDim R`),
  cited only as vocabulary for the model statements.
- `MvPolynomial.eval₂Hom`, `RingHom.ker` and
  `RingHom.ker_isMaximal_of_surjective`, whose target is a division ring.
  This is exactly the maximality used by the residual Hecke ideal.
- `TauCeti.LocalCoefficientSystem`, which at f790474 is the abbreviation
  `FundamentalGroupoid X ⥤ ModuleCat R`. The packet correctly says it gives
  no étale realization or cohomology.

The reviewed audit (AUDIT-15) finds every target of R18.1–R18.5 not built,
and R18.6 process-only. Nothing the libraries contain is planned again.

## Corrections

Each change is recorded in the packet's `review.checked`.

**Citations: 33 citations in 30 nodes.**

- **KW II locators.** The packet used page numbers one or two pages early,
  and called §7's unnumbered opening "§7.1". Lemma 7.1 is on p.60, §7.2 on
  pp.61–62, Lemma 7.3 on pp.62–63, the levels Δ_v on p.63, Lemma 7.4 on
  pp.64–65, Corollary 7.5 on pp.65–66, and §7.5 on p.66. This affected
  definite-class-set, quaternion-weight, definite-specialisation,
  split-hecke-normalisation, norm-branch, definite-degeneracy, definite-jl,
  isotropy-exponent, base-change-annihilator, tw-level, tw-stabilisers,
  tw-freeness, tw-localised-control, dyadic-norm-twist and
  dyadic-sign-extension.
- **Paraphrased excerpts replaced by printed text.** Examples: "exponent
  dividing 4Nw", "same isotropy groups", "∆v = ∆0v /∆0v [N ]",
  "fχ (g) = f (g)χ(N(g))", "χ(Nv)", "X 2 − Tv X + ψ(πv )Nv",
  "qv−1 det ρ(Frobv )", Taylor's "Suppose that l > 3" and "j!(k − 2 − j)!",
  and KW's "neat in the sense of Lemma 1.1".
- **definite-degeneracy.** The excerpt "has Eisenstein kernel" comes from
  p.66, not from Lemma 7.1; it is replaced by the lemma's own words.
- **tree-dual-graph.** The YZ citation was "§8.2" with the French excerpt
  "composantes", in an English paper. The passage is §8.3, pp.619–620.
- **Single-word excerpts replaced.** These were "Hét", "SD2", "finite",
  "abelian schemes", "représentable", "graphe", "Γg" and "hauteur 4".
  Where the cited source does not itself state the node, the match now says
  so. This applies to the integral H⁰ criterion, duality, purity and
  finite-level descent, which are generic statements requested from
  ClassicalAdicEtaleCohomology and WeightsInEtaleCohomology.
- **cohomological-degeneracy.** The node cited Carayol §§9.2–9.4. That
  passage studies the p-level morphism v : M_{n,H} → M_{n,v(H)}, not the
  degeneracy maps at w. The citation is replaced by KW Lemma 7.1, the
  definite model, and the match states that the indefinite construction is
  the standard one.
- **Source read-sections.** YZ "§8.2 superspecial uniformisation" becomes
  "§8.3". KW's read-sections now show §7's opening separately.

**Statements and closure.**

- **connected-pel-comparison.** X⁰ and X′⁰ are identity components over F̄
  (YZ Proposition 4.2, read on the page image). Only the
  O¹_{B,p}-quotients X₁⁰ and X′₁⁰ are defined over K. The statement had
  "Over K" for both.
- **definite-degeneracy.** KW Lemma 7.1 takes w ∉ Σ and adds w to S for the
  Hecke algebra. The statement said "w ∉ S".
- **norm-branch.** The statement now carries KW's definition of an
  Eisenstein maximal ideal: T_v − 2 and S_v − 1 lie in m for almost all v
  split in a fixed finite abelian extension. It previously had only a vague
  description.
- **tower-uniformisation.** Boutot–Zink treat only maximal level at the
  division place ((6.29)–(6.31)). The all-level rigid tower therefore needs
  the basic Rapoport–Zink uniformisation with p-level structures, and the
  matching of the quaternionic p-divisible group with the universal special
  formal module. The proof step now says so. PELModuli:M2 and
  R18.2/quaternion-pdiv-tower are added as prerequisites; the PELModuli:M2
  request is extended and lists this node. BC III Théorème (5.5) (p.146,
  non-maximal U_p) is cited for F = Q.
- **arithmetic-hodge-line.** YZ Theorem 4.7 is a uniqueness theorem. The API
  item `QuaternionHodgeLine.unique` is added.
- **Test QuaternionWeight.factorialObstruction.** In the monomial basis,
  ⟨X², Y²⟩ = ±2 is an antidiagonal entry, not a "diagonal value". The Gram
  determinant is ±4.
- **Planet on tw-freeness.** "Diamond freeness theorem" is not a name from
  the source. It is renamed to KW §7.4's title, "Δ_Q-freeness in presence of
  isotropy".
- **Request to StableReduction Layer 5.** Layer 5 states regular and minimal
  models and uniqueness in positive genus. It does not state finite quotients
  or formal algebraisation, and those are already requested from PELModuli:M4
  and AdicSpacesPartII:R2. The request no longer asks for "a Part II for any
  missing" theorem.
- **R18.2 coverage note.** The stage's import of Hilbert compactifications
  from ShimuraCompactifications:C6 has no consumer here, because the curves
  are compact. The note now says so.
- **sourceRouting.** All 27 KW II entries named R18.3/neatness-base-change,
  with one identical decision. Only /209 (Khare Lemma 2.2) and /272 (Taylor
  Lemma 1.1) belong there. The other 25 now name the nodes that plan them:
  the class set, weights, form space, Hecke algebra, Lemma 7.1, the isotropy
  displays (6)–(7), Lemmas 7.3 and 7.4, the twist and Proposition 7.6, and the
  dyadic noncompact level.

## Closure, granularity and structure

Every target of R18.2–R18.5 is realised. The node graph is acyclic. Every
cross-roadmap prerequisite was read in its supplier packet or in the atlas:

- R17.3: global-jl, split-hecke, definite-infinity, invariant-exchange and
  rational-models. None of them depends on R18.
- AF.4/coefficient-lattices, and AF.5/algebraic-modular-forms with its
  -structure node. Their discrete-centre hypothesis confirms the
  fixed-central-character request.
- AdicSpacesPartII R2 (accepted).
- R34.3/proper-trait-specialization-comparison, and
  R34.5/parabolic-cohomology-weight-comparison. The latter covers elliptic
  families only, which justifies the purity request.
- The atlas sub-stage ALS.5:finite-level-duality.

Two orderings of layers are wrong, although no node cycle results. Both are
recorded as restructure proposals, and a script checked that each proposed
order leaves no backward edge.

1. **R18.2 and R18.5 need each other.** The division-place cases of
   regular-model-tower and integral-pdiv use R18.5's uniformisation and
   Drinfeld representability. R18.5's uniformisation uses R18.2's auxiliary
   PEL datum and comparisons, while R18.5 uses nothing from R18.4. The
   proposal divides R18.2 into R18.2a (the auxiliary PEL datum and the
   split-place model), which comes before R18.5, and R18.2b (integral models
   at every place), which comes after it.
2. **R18.3 and R19.2 form a loop.** tw-localised-control (Corollary 7.5) and
   residual-hecke-ideal use AutomorphicGaloisRepresentations:R19.2, and
   dyadic-hecke-twist uses tw-localised-control. But R19.2 requires R18.4,
   which requires R18.3, so the atlas drops the R19.2 → R18.3 link. The
   packet's R19.2 contract correctly forbids R19.2 from using these nodes.
   The proposal moves these three nodes into a sub-layer R18.3b, after R19.2
   and before R22.

Target-level granularity is right: no proof is split into lemma nodes, and
each definition or construction has its API and at least three tests.

## Mistakes in the sources

I checked all 19 Yuan–Zhang findings at their locators and confirmed each.
Each finding now carries its own `review` with the evidence, separate from
the earlier paper review's `upstreamVerification`. The checks of note:

- **E9.** At a node, the complete local ring is O[[x,y]]/(xy−π), and both j_i
  are nonunits there.
- **E28.** At a split dyadic place with residue field F₂, the lattice
  {x ≡ y mod 2} gives a counterexample.
- **E31.** For F_℘ = Q_p(√p), the τ-quotient of Ω(I_y) is the nonzero module
  O_L/(2√p).
- **E32.** At τ, Hom over O_{E,K} has rank 2 and Hom over O_{B,℘} has rank 1.
- **E36 and E39.** Checked on the page images of pp.573 and 563.

I found no further mistake. Two things were noticed but not recorded:

- YZ's claim on p.562 that U_p(1) acts freely on X holds for the effective
  action. Carayol 1.4.1.1–1.4.1.3 and Chevalley's theorem show this.
- KW's bibliography gives Khare's Duke paper as pp.534–567, while the packet
  gives pp.557–589. The page range could not be confirmed, since Crossref has
  none.

## Red-team findings handed to the blueprint

- **RT-AREA-automorphic-1/12.** Handled correctly. The packet adds the link
  R17.3 → R18.3, and the R18.3 and R18.4 nodes cite the R17.3 nodes, so the
  supplier edge reaches R18.4.
- **RT-AREA-langlands-2/19.** Handled correctly. R18.3 owns KW Lemmas
  7.1–7.4, Corollary 7.5 and Proposition 7.6 for any admissible Q (the owners
  record). R22.2 is rescoped to choosing the primes and patching, and the
  exports go to R22.1, R22.2 and R22.6.

The handoff note also names RT-AREA-automorphic-1/20. That finding concerns
Jacobi forms and has nothing to do with this roadmap. The packet does not
cite it. The packet does deal with the related AF.5 ownership findings
RT-AREA-automorphic-1/31 and RT-RS-23/1, through definite-specialisation and
its AF.5 request.

## Suggested Lean file

The file covered only four of the sixteen definitions and constructions with
typed declarations; the rest sat in a comment ledger. That honestly follows
PROTOCOL section 13 where the carriers are missing: there are no formal
schemes, rigid spaces or étale cohomology at the baseline. But several
statements could be typed. The review added a section `CoefficientsAndCounts`
with:

- `SymWeight` and `QuaternionWeight`: the underlying module, as homogeneous
  polynomials in two variables, with `QuaternionWeight.rank` and the
  weight-two and (d, k) = (2, 4) rank tests.
- `DrinfeldHalfPlane.points` (P¹(C) ∖ P¹(K)), with
  `DrinfeldHalfPlane.affineChart`, the infinity test and the quadratic-point
  test.
- The P¹(k) counting tests for the tree, the formal model and the
  degeneracy degree.
- The C₈ diamond tests.
- The M₂(F_p) cardinality test for the split p-divisible group.
- The dimension test dim_Q(B ⊗ E) = 8 for the PEL datum.
- `QuaternionHodgeLine.metric`, with its test at i.

The ledger is synced with the packet edits, and includes the new API item.
The file elaborates with `sorry` as its only warning.

## Reader document

The reader document is not one of this job's deliverables, so it was not
edited. It now differs from the packet in these places, which an assembly or
sync job should carry over:

- line 115: connected-pel-comparison, "Over K".
- line 244: the new `QuaternionHodgeLine.unique` belongs after this item.
- line 432: the test factorialObstruction.
- line 512: norm-branch, the Eisenstein definition.
- line 528: definite-degeneracy, "w∉S".
- line 653: the tw-freeness planet name.
- line 932: the Carayol citation on cohomological-degeneracy.
- line 1212: the tower-uniformisation proof step and prerequisites.
- line 1234: the tree-dual-graph YZ citation.
- the KW locators on lines 407, 440, 456, 538, 570, 586, 617, 635, 651, 669,
  700 and 734.
- the "Dependency order" section, which should mention the two sub-layer
  proposals once they are decided.

## Questions for the orchestrator

1. Should the two restructure proposals (R18.2a/R18.2b, and R18.3b after
   R19.2) be decided before the follow-up jobs for these stages are queued?
   Both change the stage `requires` lists of a roadmap whose document
   currently places R18.5 after R18.4.
2. Gap 3 (Khare Lemma 2.2) needs the version of record of Duke Math. J. 134
   (2006). This is a candidate for the collation request list, since no
   accessible version contains the lemma.
3. The reader document needs the sync listed above. Is that done at assembly,
   or by a separate job?
