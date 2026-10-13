# REV-HilbertModularVarietiesAndShimuraCurves--R18.5

Accepted after corrections on 13 October 2026. Reviewer: Claude (Opus), session
claude-X0qFD1, issue #9393. The packet, reader document and suggested file were
written by Codex, session codex-wJAkd1 (issue #9422, PR #9468). This reviewer
wrote none of them.

This accepts a complete target-level planning pass (PROTOCOL sections 0 and 2)
of stages R18.5 and R18.6. The packet imports the twelve R18.5 targets that the
accepted R18.2 packet owns and adds refinements of them. R18.5 stays
**planned**, with its six recorded conditions and two new follow-up items in
`remaining`. R18.6 stays **source_decomposed**: under the accepted RS-23 it is an
export index with no nodes. Every implementation status remains `unchecked`.
The per-node evidence is in the packet's `review.checked`: one node verified,
seven corrected, one added, none unverifiable.

| Measure | Input | Reviewed |
| --- | ---: | ---: |
| Nodes (definitions / theorems / comparisons) | 8 (2 / 2 / 4) | 9 (2 / 3 / 4) |
| API items / unit tests | 8 / 8 | 8 / 8 |
| Planets (this packet / R18.5 combined) | 1 / 6 | 1 / 6 |
| Pinned baseline declarations | 7 | 7: six confirmed, one removed, one added |
| Supplier requests / gaps | 10 / 6 | 10 (one narrowed) / 6 (one narrowed) |
| R18.6 exports | 6 | 7 |
| Source issues | 0 | 1 (confirmed) |
| Planned / source-decomposed stages | 1 / 1 | 1 / 1 |

`python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings.
`scripts/check_sorry_data.py` passes. `lean-check` elaborates the revised
suggested file (156 lines) in the shared build at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174, with fifteen `sorry` warnings and no
other message. The file imports only Mathlib modules.

## What was read

All eight sources were downloaded, and every SHA-256 matches the packet. Text
was extracted with `pdftotext`. Kurihara's scan has no text layer, so §3 was
read on rendered page images. Boutot–Carayol's OCR is rough but legible.
Printed pages equal PDF pages in BZ, CDN and KRZ. In the Boutot–Carayol volume
the PDF page is the printed page plus 5.

| Source | Passages checked |
| --- | --- |
| [Boutot–Zink, arXiv:2212.06886v1](https://arxiv.org/pdf/2212.06886v1) | §1 (pp.1–4), Lemma 2.1 (p.6), §4 (4.1)–(4.6) (pp.17–18), §5 Definitions 5.2–5.6, Proposition 5.4, (5.9)–(5.23), Lemma 5.10, Proposition 5.11 (pp.34–40), §6 (6.1)–(6.53), Propositions 6.1, 6.2 and 6.6, Theorems 6.3 and 6.7, Corollary 6.8 and the proof of 6.7 (pp.40–51) |
| [Boutot–Carayol, Astérisque 196–197](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf) | Part III §§5.1–5.5 (pp.139–146): Theorem 5.2, §§5.3.1–5.3.3, §§5.4.1–5.4.4 with Kurihara's theorem, Theorem 5.5 |
| [Carayol, Compositio 59 (1986)](https://www.numdam.org/item/CM_1986__59_2_151_0.pdf) | Notations (pp.155–156), §4.1–4.5 (pp.181–189), including Propositions 4.2.2, 4.2.3 and 4.4.3 and §§4.5.1–4.5.5 |
| [Colmez–Dospinescu–Nizioł, arXiv:1704.08928v2](https://arxiv.org/pdf/1704.08928v2) | §1.2 (pp.12–13), §4.1 (p.34, the groups Ǧ_n), §5.2.1–5.2.2 with Proposition 5.4 and Remark 5.5 (pp.40–43) |
| [Kurihara, J. Fac. Sci. Tokyo 25 (1979)](https://repository.dl.itc.u-tokyo.ac.jp/record/39680/files/jfs250303.pdf) | §3 (pp.284–289): Definition 3-1, Proposition 3-2, Lemma 3-3, the blow-up subdivision on p.288, Proposition 3-4 |
| [Kudla–Rapoport–Zink, arXiv:2007.05211v1](https://arxiv.org/pdf/2007.05211v1) | Proposition 7.1.11 (p.115), Lemma 7.3.1 (p.120), Proposition 7.3.2 and Theorem 7.3.3 (p.121) |
| [Yuan–Zhang, Annals 187 (2018)](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) | §4.2, Propositions 4.2–4.4 (p.563, for the split-place reconciliation); §8.3, the superspecial multiplicity paragraph (p.619) |
| [Khare–Wintenberger II, author copy](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | Lemma 7.1 (p.60), the neatness step around Lemma 8.3 (p.73), the use on p.77: the R18.6 consumer pages only |

Rapoport–Zink's book is not in the cleared library and was not read, as the
packet already records. The packet contains no verbatim source excerpt.

## Baseline citations

Every declaration was read in its source file at the pinned Mathlib.

- Confirmed: `DoubleCoset.Quotient` (the quotient by the double-coset setoid of
  two sets), `DoubleCoset.eq` (equality of classes is witnessed by left and
  right multiplication), `LinearMap`, `AddSubgroup`, `MulAction`, and the
  instance `groupCohomology.H1ofAutOnUnitsUnique` (Noether's Hilbert 90 for a
  finite extension).
- Removed: `AlgebraicGeometry.Scheme`. It exists, but no node of this packet
  cites it.
- Added: `groupCohomology.exists_div_of_norm_eq_one` (Hilbert 90 in norm form
  for a finite cyclic Galois extension with a chosen generator). The transfer
  theorem's surjectivity step uses exactly this form; see below.

## Node-by-node corrections

**PelHeightLattice.** Faithful to BZ. The labels (a,b) are half the relative
heights of the two quasi-isogeny components (5.10), and a+b is even (5.12).
(5.23) gives RZ ≅ RZ(0,0) × Λ, and (6.39) embeds the quaternionic heights
diagonally. The locator now cites (5.10) and (5.12), and (6.39) on p.48, not
p.49. The suggested file now defines Λ as Mathlib's `AddSubgroup` of ℤ×ℤ, with
the closure fields proved by `omega`, so the cited `mathlib:AddSubgroup` is
really used. The API and the four tests are unchanged and true.

**VeryFreeChartAction.** The definition matches BC Part III §5.3.1, p.142: every
nonidentity element moves every vertex by more than 2. It applies to the
projected determinant-valuation-zero stabilizers. Proof step 3 said that the
small-level argument was part of the quotient theorem, but that theorem takes
very freeness as a hypothesis. Step 3 now points to the added node below. The
Lean predicate, its four API theorems and its four examples were checked by
hand and are true.

**Added: VeryFreeChartAction.smallTameLevel** (`/very-free-small-level`). No
node owned the claim that a small tame level makes every projected Γ_g act very
freely. Applying the chart-gluing theorem to arithmetic quotients needs it, and
the R18.2 arithmetic-quotient check text already appeals to it. The proof
adapts BZ's argument in the proof of Proposition 6.6, p.48, which shows the
projected groups act without fixed points, to displacement at most 2. It uses
discreteness of the adjoint group's rational points, a finite set of short
displacements, and a normal shrinking of the level, with conjugation for the
other double cosets. Displacements are even here, so the condition excludes
exactly displacements 0 and 2.

**VeryFreeDrinfeldQuotient.** Gluing, the vertex- and edge-orbit description,
radius-one injectivity and stability (q+1 ≥ 3 distinct attaching points, no
loops or multiple edges under very freeness) all check. The packet said no
algebraisation target exists. In fact the accepted AdicSpacesPartII packet has
`AdicSpacesPartII:F0/grothendieck-algebraization`: formal GAGA for a proper
formal scheme carrying a line bundle with ample reduction. It is now a
prerequisite here and in the weighted-graph theorem. The AdicSpacesPartII
request and the first gap are narrowed to what is genuinely missing:
- the separated quotient by the discrete group;
- the finite quotient used at nonsmall levels;
- a line bundle with ample reduction on the quotient. Its lifting
  obstructions lie in H² of coherent sheaves on a curve, so they vanish.

**AuxiliaryPelLocalFactors.** Verified against BZ Definitions 5.3 and 5.6,
Proposition 5.4, Lemma 5.10 and Proposition 5.11. In Proposition 5.11 the pair
(δ1,δ2) with δ1δ2 central shifts the two labels by ord det δ1 and ord det δ2.
The degree-(1,1) corrected Weil datum is in the proof of Theorem 6.3,
pp.44–45. The level hypothesis is restated exactly (below).

**QuaternionicPelUniformisationTransfer.** The following were checked against
BZ:
- the kernel c ↦ (c, c⁻¹) of the multiplication map (Lemma 2.1, p.6);
- Ď^× ⊂ I(Q) ((6.22)–(6.23));
- the central sequence (6.34);
- the open and closed immersion (Proposition 6.6), with its unit-class and
  Chevalley argument;
- the surjectivity by compatible framings and Hecke transitivity (proof of
  Theorem 6.7);
- the descent datum id × |Π⁻¹ × τ_c.

Corrections:
- Locators: Definition 6.5 is on p.47, not p.48, and (6.29)–(6.31) are on p.46,
  not pp.47–48.
- Hecke compatibility now covers the operators of B^×(A_f) for varying
  permitted levels, as Theorem 6.7 states, not only tame ones.
- The Hilbert 90 step is written out. For x ∈ I(Q) with x′x = f ∈ F^×, the
  element f/Nrd(x) of L^× has norm 1, because Nrd(x′)Nrd(x) = f². So it equals
  σ(k)/k, and x k⁻¹ lies in Ď^×.

KRZ Proposition 7.1.11 (one isogeny class), Lemma 7.3.1 (descent) and
Proposition 7.3.2 (bijectivity via the Hasse argument and RZ 6.30) are at the
cited pages. They support the PEL supplier contract exactly as the packet
scopes it.

**SplitPlaceDescentBoundary.** Faithful to Carayol:
- Proposition 4.4.3 (p.188) compares the level-zero components over F_p^nr
  with their O_p-linear p-divisible groups, equivariantly for
  Δ₀/SL₂(O_p) ⊂ Δ′₀/SL₂(O_p).
- §4.5.1 lifts the comparison to the full level-structure covers over F_p^nr.
- §4.5.5 compares neutral level-n components over F_p^n, with H′ chosen after n.

The definition of F_p^n now follows Carayol's notations exactly: the extension
of F_p^nr cut out by U_p^n under local class field theory (p.155).

YZ Proposition 4.4 (p.563) states its finite-level comparison over a field "K"
that the passage does not define. That is the gap the H0 packet records. This
node supplies the field at split places. It also restates, with correct fields,
the R18.2 targets connected-pel-comparison and finite-pel-comparison. An
acceptance item now instructs the assembly to merge them, so that the
comparison has one owner.

**DrinfeldLevelStructureComparison.** Checked against:
- CDN §4.1, p.34 (Ǧ_n = 1 + ϖ_D^n O_D);
- CDN §5.2.1 and Proposition 5.4, p.43 (rigid isomorphisms compatible in n
  and U);
- BC Theorem 5.2 (the uniformisation lifts to the special formal modules);
- BC §5.3.2 (at a coarse level neither side carries a natural formal
  O_D-module);
- BZ (6.2)–(6.7).

Added prerequisite `R18.2/quaternion-pdiv-tower`, which ties the canonical
tower to torsion levels of the generic p-divisible group. A proof step records
that its ideal-indexed levels 1 + n O_B,p give only the even division levels
1 + Π^{2m} O_D at v. The odd levels need the Π-torsion of the module.

**WeightedArithmeticQuotientGraph.** Kurihara §3 was read on the page images:
- p.284: the Schottky subgroup Γ₁ with det Γ₁ trivial modulo squares.
- p.285: the normal, proper and flat model P_Γ = P_{Γ₁}/(Γ/Γ₁).
- Proposition 3-2, pp.286–287: k-rational components and split nodes,
  completed local rings R[[X,Y]]/(XY − π^m) with m the stabilizer order, and
  the genus formula.
- Lemma 3-3, p.288: finite quotients of the local models.
- p.288: the subdivision 1, m−2, 1 under blow-up.
- Proposition 3-4, p.289: contraction of valence-one components.

BC §§5.4.1–5.4.4 agree, including the deletion of reversal-fixed edges. Added
to the node: the genus formula, g = 1 + #edges − #vertices of (Γ\T)*, as
statement and acceptance; the Schottky-quotient construction step; and the
algebraisation prerequisite.

## Standing hypotheses corrected

The packet and reader said that statements under the BZ hypotheses "do not
quantify over arbitrary p-adic levels". BZ fixes only the level at v, which is
maximal. At the other places over p the levels are arbitrary open compact
subgroups of the units of the chosen maximal orders (p.3 and (6.29), p.46). The
PEL level is built from them in the form (4.6), with multiplier groups O^×
((6.31), p.46). The conventions paragraph and the three hypotheses that cite
(6.29)–(6.31) now say this.

## R18.6 and incoming requests

- **Export added.** `SerreWeightAndLevelOptimisation:R20.2/ribet-exact-sequence`
  requests this geometry from R18.6. It needs the Shimura curve of discriminant
  pq at Γ₀(M) level, its genus-zero reductions at p and q, and the character
  groups with their Hecke action. The export index did not list it. Export 7
  now supplies it from the uniformisation theorems, the Kurihara graph with
  lengths (Γ₀(M) is not a small level) and the character-lattice targets. The
  atlas's stage link from R18.6 is to R20.1. The node-level consumer is R20.2.
- **Follow-ups recorded in `remaining`.** No R18 node plans two requests
  addressed to R18.5:
  - `AutomorphicGaloisRepresentations:R19.2` asks for Carayol §§7–9 (the
    supersingular locus at a split prime through Drinfeld's height-2 formal
    modules with level structure) and Brylinski's vanishing-cycle
    identification.
  - `GrossZagierAndArithmeticHeights:GZ.0` and `HeegnerPointEulerSystems:HE.0`
    ask for CM fixed points on the half-plane, their reduction to the tree,
    and CM specialization with the Atkin–Lehner convention.

  The packet does not plan them, and the reader now says so.

## Source issues

The packet recorded none. The review adds and confirms
`HilbertModularVarietiesAndShimuraCurves/E40`, a misprint. The proof of BZ
Theorem 6.7 (p.51) cites "Lemma 6.6" three times. The paper has no Lemma 6.6,
and each use is the conclusion of Proposition 6.6 (p.47). It affects nothing.
arXiv lists only v1, with no journal reference.

## Reader document

Every change above is mirrored in the reader:
- the targets are renumbered to 21, with the new target 10;
- the baseline table had a blank line that broke the markdown table; it is
  fixed, the unused row is removed and the new row added;
- the inherited TotallyRealUniformisation check now places the BZ levels on
  p.46;
- the supplier, condition and erratum paragraphs are updated.

Packet and reader agree on every statement, prerequisite list, source locator,
API name and test name, which a script checked mechanically.

## Questions for the orchestrator

1. At assembly, replace the fields in R18.2/connected-pel-comparison and
   /finite-pel-comparison with those of SplitPlaceDescentBoundary. Then mark the
   H0 gap "Carayol descent field in the finite-level bridge" resolved at split
   places. Neither file was editable here.
2. The R18.2 packet's own text for TotallyRealUniformisation still places the
   BZ auxiliary levels on pp.47–48. They are on p.46.
3. Decide the owner of the two incoming requests: Carayol §§7–9 with
   Brylinski, and CM fixed points and specialization. This layer can plan
   them as a follow-up, or they can move to their consumers.
4. ReductiveGroupsPartII is now in TauCetiRoadmap. Its RG2.2 `sl2-tree` target
   plans `BTTree.Vertex`, `Adj`, `tree`, `isTree`, the (q+1)-valence and the
   GL₂ action. The packet's `ReductiveGroupsPartII:RG2.2` citations are right
   in substance. In a package they become the Tau Ceti roadmap.
