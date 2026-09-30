# RT-PAPER-ELLENBERG-VENKATESH-WESTERLAND-16: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #4994, job
FIX-RT-PAPER-ELLENBERG-VENKATESH-WESTERLAND-16).

**Scope.**
- **Findings:** `RT-PAPER-ELLENBERG-VENKATESH-WESTERLAND-16.result.json`, by cc-f805bf.
- **Verdicts:** `RT-PAPER-ELLENBERG-VENKATESH-WESTERLAND-16.review.json` and
  `reviews/REV-RT-PAPER-ELLENBERG-VENKATESH-WESTERLAND-16.md`, by Codex session codex-rtOQ9t. All sixteen findings are
  confirmed.
- **This job:** the issue lists the nine medium findings (/1–/5, /7–/9, /11), and this job applies them. The seven
  low ones (/6, /10, /12–/16) are not part of it.
- **Corrections:** where the verifier qualified a fix, I applied its version. Each section says how.

**Files changed.**
- `papers/PAPER-ELLENBERG-VENKATESH-WESTERLAND-16.result.json`. The edits were made by a script that asserts each
  replaced string occurs once, and it writes the file's own format (indent 2, UTF-8).
- `papers/PAPER-ELLENBERG-VENKATESH-WESTERLAND-16.md`, which gets a closing section.

**Result.** Before and after:

| | Before | After |
|---|---|---|
| Items | 137 (7 library, 8 planned, 122 missing) | 142 (7 library, 9 planned, 126 missing) |
| Route 1 (Part II), route 2 (IG), route 3 (ST) | 53, 23, 46 items | 44, 34, 48 items |
| Item dependency edges | 243 | 253, still acyclic |
| Cross-route dependencies | IG → Part II, IG → ST, Part II → IG, ST → IG, ST → Part II | only Part II → IG, ST → IG and ST → Part II |
| Prerequisites | 11 | 13 |
| Source issues | 19 | 20 |

**Independence.** I did none of:
- the extraction (codex-a71f92, codex-c83e7a, cc-442dc5);
- its review (cc-7b31c4);
- the red team (cc-f805bf);
- the verification (codex-rtOQ9t).

**What I read, on 30 September 2026.**
- **The published PDF** (sha256 `6c10d770…a7f6`, the extraction's hash), at §§2.1, 7.1–7.8 (pp. 738, 766–770),
  p. 779, the abstract and pp. 729–730, and the bibliography.
- **The arXiv v4 PDF** (sha256 `4adef21f…771c`), at p. 1.
- **The arXiv API record** of 0912.0325.
- **Crossref**, for the SGA 4 XI chapter and a reprint of Katz–Lang.
- **In the atlas:** IG.0, IG.1, IG.3, IG.5, ST.5, SF.2 and C4; Tau Ceti AlgebraicCurves Layers 3, 10 and 12,
  GeometricTopology Layer 3 and JacobianChallenge Layer F; and the stage-edge graph in `data/atlas.json`.
- **In other extractions:** the items and routes of PAPER-WOOD-19 (86, 134, 255, 259),
  PAPER-LANDESMAN-LITT-24 (51, 113 and route 1's brief) and PAPER-LIU-WOOD-ZUREICKBROWN-24 (route 2).

## /1 (medium, error) and /3 (medium, duplicate): the Hurwitz vocabulary moves to IG.3 and IG.5

The two findings apply together. The verifier warned that moving /22 while it still depends on /18 would recreate the
cycle, and asked me to recompute the dependencies after all the moves.

**Moves.** Items 8–14, 17, 22 and 24 leave route 1 for route 2, and each note names its stage:
- IG.3 plans "the braid action" on generating tuples, and takes items 10, 11, 17, 22 and 24;
- IG.5 plans "Hurwitz moduli with braid/Nielsen-class components", and takes items 8, 9, 12, 13 and 14.

**Arbitrary tuples.** Item 11's statement now says that the action is on arbitrary tuples in G^n, with product one,
generation and class conditions imposed separately. Item 12's note says the same, as the verifier asked, so that the
disc setting (EVW) and the product-one setting (Wood, LWZB) share one construction.

**Item 22 (the braid-orbit monoid).**
- The dependence on item 18 is removed. The statement now gives the elementary proof: the block inclusion B_n × B_m
  → B_{n+m} acts on a concatenated tuple through its two factors.
- Item 18 (the gluing, Part II) now depends on item 22. The stale `uses` entry is moved from item 18 to item 22.
- The note records that PAPER-WOOD-19/255 and /134 use the same monoid at IG.3.

**Item 24** records that its input, Fried–Völklein's appendix Lemma 3, is the one PAPER-WOOD-19/255 uses.

**Kept in the Part II.** Items 23, 25 and 26 stay there, with notes saying that they import the monoid. As the verifier
noted, Wood's central element is a product of power blocks and EVW's U_D is a sum, so the two theorems are not
interchangeable.

**Route 1's reason.** "§§3–6" is corrected to §§4–6, and the reason names the moved items and the other extractions
that route the same objects to IG.

**The check.** After all edits, I recomputed every item edge against route membership. No item of route 2 depends on
an item of route 1 or 3, and no item of route 1 depends on an item of route 3. So the implied roadmap order is
IG → Part II → ArithmeticStatistics, the parent comes first, and both cycles are gone. The item graph has 253 edges
and is acyclic.

## /2 (medium, error): item 137 moves to ArithmeticStatistics

- **The move.** Item 137 (arithmetic monodromy quotient and the cyclotomic multiplier) goes to route 3, with the
  items 96 and 99 it serves. Its routing group is now "stats", and IG no longer needs GSp (item 100).
- **The verifier's condition.** The general arithmetic fundamental-group sequence stays an IG import, through item
  127, which is planned at IG.0 and R09.4.
- **Route 3's reason** records that ST.5 imports:
  - IG.0 (item 127);
  - IG.5 (items 63, 131–133);
  - the Part II (item 69).
- **The atlas edges.** I checked `data/atlas.json`. Neither ST.5 nor IG.5 reaches the other, so the edges IG.5 →
  ST.5 and Part II → ST.5 close no cycle.

## /4 (medium, duplicate): (7.8.2) is split from item 69

- **The new item.** `mod-l-comparison` is routed to IG.5. It states (7.8.2) with the hypotheses of Proposition 7.8:
  - (G, c) center-free and rational, q prime to |G|, and L > max(|G|, q, n);
  - Proposition 7.7 over W(F_q) for PConf_n ⊂ X_n with the S_n-action;
  - Artin's comparison at the complex fibre;
  - exact S_n-invariants for L > n.

  As the verifier required, it says that the coefficient maps are the composites of these, and that it asserts
  neither Frobenius equivariance nor stability.
- **Owner.** Its note records that it is PAPER-WOOD-19/86 and /259 at the same owner.
- **Item 69.**
  - It keeps (7.8.3), the cell bound and the Q_L step.
  - Its dependency on item 68 is replaced by `mod-l-comparison`.
  - Its statement imports the comparison instead of performing it.
  - Its note repeats that the comparison alone gives no stability.

## /5 (medium, duplicate): mapping classes of the marked disc

**The routing problem.** The red team proposed citing MappingClassGroupsAndCanonicalRepresentations in items 9 and
10. Those items now sit in IG (/1), and Landesman–Litt's route 1 brief imports IG.0 and IG.1. Having IG import that
roadmap would recreate the kind of cycle /1 removes.

**The resolution.** It follows the verifier's "import these and expose the disc adapter":
- **Item 9** keeps only the configuration-space statement: Conf_n(D) is a K(B_n,1) with π_1 = B_n, σ_j the loop
  exchanging adjacent points.
- **Item 10** keeps only the freeness of π_1(D − S) on peripheral loops.
- **The new Part II item `disc-mapping-class-adapter`** carries the rest:
  - π_0 Diff⁺(D, ∂D; S) ≅ B_n with half twists as σ_j, compatible with item 9;
  - Artin's action on π_1;
  - the comparison of peripheral generating systems.

  Its locator is p. 738 ("π_0Diff⁺(Σ, ∂Σ) ≅ B_n ≅ π_1(Conf_n, c_n)"), with the use in §5.5. The Part II may import
  both owners, and item 52, the arc stabiliser, depends on the adapter.

**The verifier's qualifications, in the adapter's note.**
- The boundary is fixed pointwise but the points are permuted, which is not Landesman–Litt's pure group.
- LL24/113's hypothesis 2g − 2 + n > 0 does not cover every small n.
- GeometricTopology Layer 3 is used for the compact disc with marked interior points, since its text postpones
  noncompact manifolds.
- The half-twist identification and the peripheral comparison stay adapters until proved.

**Route 1's brief** imports both owners through the adapter. The arc complex and its stabiliser (items 50–52) stay in
route 1, as before.

## /7 (medium, duplicate): Tau Ceti AlgebraicCurves

- **Item 83.** The API entry `classGroupPicardIso` is replaced by `classGroupPicardWrapper`, labelled a specialization
  wrapper. The note cites AlgebraicCurves Layer 3 for Cl⁰(F) ≅ ClassGroup(R_x) with a single degree-one place at
  infinity. I checked that Layer 3's text states exactly this.
- **The verifier's distinction.** Comparing Cl⁰ with the F_q-points of the Picard scheme also needs the
  curve/Picard/Jacobian dictionary. The note names AlgebraicCurves Layer 12, whose text says the Pic-style class groups
  agree with Cl(F), and JacobianChallenge Layer D.
- **Item 96's note** cites AlgebraicCurves Layer 10 for the odd-degree hyperelliptic model and g = (n − 1)/2
  (Stichtenoth Prop. 6.2.3, which Layer 10's text names). It keeps the torsion local system, the Weil pairing and the
  multiplier.
- **Route 3's reason** adds the AlgebraicCurves import.

## /8 (medium, missing): the two comparison theorems

**The check.**
- The proof of Lemma 7.4 (p. 767) cites "[31, Exp. XII, Th. 5.1]". What it needs is: a tame G-cover of P¹_C
  branched at S or S ∪ {∞} is a conjugacy class of surjections π_1(A¹(C) − S) ↠ G.
- The proof of Proposition 7.8 (p. 769) cites "[6, Th. 4.4, Exposé XI]".

**(a) `artin-comparison`.**
- It is stated for smooth X of finite type over C, with Z/L coefficients. The smooth case suffices, since PHn^c is
  finite étale over PConf_n.
- It is marked planned at SF.2, as the finding asked. The note gives the verifier's caveat: SF.2 is the integration
  owner of the CohomologicalPointCounting ComplexComparison supplier, whose status is "requires declaration and proof
  verification". SF.2's text does not name this theorem, so the design job should confirm the contract there.

**(b) `riemann-existence-punctured-line`: not marked planned.** The verifier said C4 does not plan Riemann existence
for arbitrary finite-type schemes. I read C4, which plans Chow algebraization, GAGA and the connectedness of affine
complex curves. The atlas has Riemann existence only at IG.3, which consumes it, and in Tau Ceti BelyiMaps Layers 8
and 12, for three-point covers.

So the item states the instance EVW needs, finite étale covers of A¹_C − S for finite S, and is routed to IG.3 as a
missing request (route 2).

**Dependencies.** Item 65 depends on (b). Item 69 reaches (a) through `mod-l-comparison`, since /4 moved the comparison
there.

**Prerequisites** gain SGA 4 XI (Artin, LNM 305, doi:10.1007/BFb0070717, verified on Crossref).

## /9 (medium, missing): abelian covers and Jacobian torsion (Katz–Lang)

**The new item `katz-lang-abelian-covers`** is routed with item 96 (route 3). It gives the general contract: for C
smooth proper connected over k algebraically closed, with a base point, ℓ ≠ char k and ℓ^k A = 0:
- H¹(C, A) = Hom(Jac(C)[ℓ^k], A), equivalently π_1^ab(C) ⊗ Z/ℓ^k ≅ Jac(C)[ℓ^k];
- A-torsors correspond to homomorphisms, and connected ones to surjections.

**The verifier's correction.** I did not apply the finding's Aut(A)-quotient. The item keeps Sur(Jac[ℓ^k], A),
because an A-cover carries its action. It notes that item 97's Sur(V, A)/{±1} comes from the hyperelliptic involution
(E10).

**Other changes.**
- It imports the Abel–Jacobi map and the Albanese property from JacobianChallenge Layer F.
- Item 97 now depends on it.
- The locator quotes p. 779: "[37, (2.4)]; in the case at hand, this is just Kummer theory".

**Prerequisites** gain Katz–Lang (Enseign. Math. 27 (1981), 285–319). The link is the Crossref-verified reprint in
Lang's Collected Papers III, since I found no DOI for the Enseignement printing.

## /11 (medium, other): the abstract's domain

**The check.** The published abstract (p. 729) says "for q greater than Q", as does the v4 PDF (p. 1). The paragraph
after Theorem 1.2 (p. 730) says "for q > Q0(ℓ)". Theorem 1.2 itself has q ≢ 1 (mod ℓ). The arXiv API abstract for v4
does carry "and not congruent to 1 modulo l".

**E20** is a gap that affects a stated result, with the finding's locator and a quotation of both printed sentences.
- **The correction** gives the proved domain: q ≢ 1 (mod ℓ), odd and prime to ℓ, as E11 has. It says that the paper
  proves nothing for q ≡ 1 (mod ℓ).
- **The reason** gives the A = (Z/ℓ)² example: ℓ Frobenius-stable Sp-orbits, classified by the pairing value (Witt).
  I checked the verifier's ℓ = 3, g = 2 counts by hand: 80·24 = 1920 isotropic pairs and 80·27 = 2160 for each
  nonzero value.
- **What E20 does not say.** Following the verifier, it does not say that the abstract is false, that positive
  proportions fail, or that the authors claimed the Cohen–Lenstra limit at q ≡ 1 (mod ℓ). Garton's modified
  distribution is left open.
- **The known field** says "new: no correction found". It also says that the arXiv listing abstract carries the
  congruence while the v4 PDF and the published text do not.

**Item 110's note** says that the printed claim is broader than what is proved.

## Not applied, and why

- **The seven low findings** (/6, /10, /12–/16) are outside this issue. Three of them touch these edits:
  - /6 would cite TauCeti.IsCoveringMap.isEilenbergMacLaneSpaceOne_totalSpace in the configuration-space items;
  - /15 is the missing `sourceVersions`;
  - /16 would qualify the summary's "every numbered statement is an item".

  The E20 entry nevertheless records the PDFs it read in its `searched` field.
- **The finding's Aut(A)-quotient in /9.** The verifier rejected it, as said above.
- **"Planned at IG.3 with C4" in /8(b).** The verifier rejected it, as said above.

## For the maintainer

- **Atlas stage edges** for route 3's imports: IG.5 → ST.5 and InverseGaloisPartIIHurwitzHomologicalStability → ST.5.
  Neither closes a cycle in `data/atlas.json`.
- **DESIGN-MappingClassGroupsAndCanonicalRepresentations.** This extraction's Part II consumes the disc case with one
  boundary component and n marked points, with the points permuted, not the pure group. Its layers that the Part II
  imports should not depend on IG.3 or IG.5.
- **Two reference slips in EVW, which I noticed but did not record as source issues** (they are outside the findings):
  - reference [6] is SGA 4 Tome 1 (LNM 269), but the proof of Proposition 7.8 cites its Exposé XI, which is in Tome 3
    (LNM 305);
  - reference [31] is the 1963 IHÉS SGA 1 fascicule "Exposés 6, 8 à 11", but Lemma 7.4 cites its Exposé XII.

  A later errata or red-team job should confirm them against the volumes.
- **Review verdicts.** The routes keep their kinds and targets, so no route needs a new verdict. Membership did
  change: route 2 grows from 23 to 34 items and route 1 shrinks from 53 to 44. The paper's review may want to note the
  moves.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/*.result.json`: every extraction ok.
- `source_issues.check_issues` on the 20 entries: no errors.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- Item graph: 253 edges, acyclic, and no route-order back edge (script output: `back edges: []`).
- Every missing item is routed exactly once.
