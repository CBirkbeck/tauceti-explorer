# PAPER-BRIGHT-NEWTON-23: Evaluating the wild Brauer group

Martin Bright and Rachel Newton, [Inventiones mathematicae 234 (2023), 819–891](https://doi.org/10.1007/s00222-023-01210-8).

Original extraction: Claude Code, session cc-39fac3, issue #1239, PR #1962.
Independent revision: Codex — codex-a71f92, REV-PAPER-BRIGHT-NEWTON-23, issue #1240, 23 September 2026.

Status: **partial**. The independent review is finished with verdict **revise**.
The [result](PAPER-BRIGHT-NEWTON-23.result.json) contains 117 items: 4 library,
4 planned and 109 missing. All missing items have one route, but routes 2, 4
and 5 are rejected; a routing count is not a dependency-closure certificate.
The [review](../reviews/REV-PAPER-BRIGHT-NEWTON-23.md) records the corrections
and remaining work. There are 13 prerequisite entries and 14 source findings.

## What is being extracted

For a finite extension k/Q_p, let 𝒳/O_k be a smooth model of a smooth
geometrically irreducible variety X/k with geometrically irreducible special
fibre Y. Properness is not assumed for this local theory. The evaluation
filtration quantifies over all finite k′/k and integral points of the base-changed
model, with disc radius multiplied by e(k′/k).

Theorem A identifies this filtration with the modification of Kato's filtration:
Ev_{−2}=ker ∂, Ev_{−1}=∂^{-1}H¹(𝔽,Q/Z), Ev_0=fil_0, and, for n≥1,
Ev_n consists of classes in fil_{n+1} whose refined Swan conductor has zero
second component. Unramified extensions suffice to test the condition.
Items 1–5 and 82–93 retain the exact quantifiers and base-change cases.

Theorem B and Theorem 8.1 describe evaluation by the differential components
[α,β] of rsw. Item 70 gives the first-order trace formula; items 71 and 73
record the longer bilinear and higher-order surjectivity statements with their
ramification and Cartier hypotheses. These are not abbreviated to an
unconditional surjectivity assertion. The proof of the second formula of
8.1(3) has the model/filtration obligation recorded in E12.

Theorem C applies to a smooth projective variety over a number field with a
nonzero global 2-form and a specified place of good **ordinary** reduction.
After finite extension it produces a Brauer class obstructing weak approximation
at a place over that prime. It answers Question 1.3 negatively in general.
The 2023 argument does not supply an ordinary prime for every such variety.

Theorem D treats smooth proper geometrically irreducible varieties with
finitely generated torsion-free geometric Picard group. All Brauer evaluations
are constant outside the specified finite set: archimedean places, bad
reduction, e≥p−1, and places where the special fibre has a global 1-form.
Questions 1.3–1.5 are now problem definitions (items 6,7,9), not assertions
to prove. Remarks 1.6 and 11.5 remain required extraction targets.

A subsequent paper, [Ambrosi–Newton–Pagano, Wild Brauer classes via prismatic
cohomology](https://arxiv.org/abs/2509.22025), Corollary 1.1.2, proves that
weak approximation over all finite extensions forces H⁰(Ω²)=0. For the
smooth projective varieties of Question 1.4, Hodge symmetry gives H²(O)=0.
This is later progress, not an ordinary-reduction theorem proved in 2023.
Only the sequel's introduction and stated comparison were checked here.

## Source record

The reviewer read all 73 pages of the [published PDF](https://d-nb.info/1314744992/34),
including proofs and references, and compared the relevant error passages with
[arXiv v5](https://arxiv.org/pdf/2009.03282v5). This does not certify the
original extractor's claim of a complete word-level diff of both versions.

- Published PDF SHA-256: 0e96ca755aa61e748bca722ea2c1107bed115575ff4fa8d6c751b721c33e79d2.
- Final-v5 PDF SHA-256: bc6926b9002f6d5a07a1c25647d3a60efaaf39f20553ecaf7f0c6a2a4d3f4fc1.
- Borger, [Conductors and the moduli of residual perfection](https://maths-people.anu.edu.au/~borger/papers/_all/ConductorsAndTheModuliOfResidualPerfection.pdf), §§4.1–4.11 checked for coefficients, filtration and the correct log point; SHA-256 4b32ea9e723f4b2dbb2ebeaadd4b9ecf26b06179070ca24a336b5e7129244abc.
- [Stacks 0FMU](https://stacks.math.columbia.edu/tag/0FMU), especially Definition 50.15.1 and Lemma 50.15.2, checked for the hypotheses and divisor-supported residue target.
- ANP author PDF dated 30 October 2025, SHA-256 f081fa16b0362447ee560a7e654fecfeb446eef1afd387082033b46e9340ca68, §§1.1.1–1.1.3 checked, not the whole sequel.

Published page numbers are used in the extraction. The source search on
23 September 2026 checked the publisher article, Crossref correction fields,
arXiv version history, Newton's research list and bounded title/correction
queries. No linked formal correction was found. E7 records the later resolution
explicitly; the other findings' “new” classification is bounded by that search.

## What is already supplied

The pinned revisions are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174
and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

New items 114–117 explicitly import ordinary Kähler differentials and universal
derivation, ordinary abelian-sheaf cohomology, the derived category of an abelian
category, and the invertible-exponent Kummer short exact sequence of discrete
Galois modules. Their declarations were read at the pins. None is a substitute
for log differentials, hypercohomology, p-primary characteristic-p coefficients,
or a cohomological Brauer comparison.

Items 12–16 retain these planned suppliers:

- Class Field Theory, Layer 5: local cohomological Brauer invariant and residue;
- HeightsRationalPointsAndObstructions:RP.2: adelic points and Brauer–Manin pairing;
- CrystallineCohomology:CR.4: de Rham–Witt complexes;
- HigherLocalFieldsAndHigherClassFieldTheory:HL.2: wild logarithmic coefficients;
- DerivedDeRhamCohomology:DD.3: Cartier comparison.

These are plans, not library implementations. Generic de Rham–Witt theory,
logarithmic exactness and field-colimit adapters must be separated in the next
atomic ledger. The reviewed coverage file has no CR.4/DD.3 entry at this snapshot;
their current stage descriptions, not a nonexistent reviewed audit, were used.

## Route decisions

| Route | Destination | Review |
|---|---|---|
| 1 | SchemeAndStackFoundations:SF.2, items 19,48,88,106,110 | Accept as scoped sources: henselian-pair base change, purity, H¹ kernel and proper base-change inputs |
| 2 | WeilConjectures:WC.5, item 87 | Reject: actual stage is smooth-projective, while the use needs arbitrary varieties and open loci |
| 3 | HeightsRationalPointsAndObstructions:RP.2, item 14 | Accept the corrected one-place test |
| 4 | LocalFieldsPartIIKatoSwanConductors | Reject pending atomic closure and supplier boundaries |
| 5 | HeightsRationalPointsPartIIWildEvaluation | Reject pending atomic closure and the specified source-proof repairs |

The Part II directions are reasonable candidates, not approved designs.
The upstream local-fields roadmap assumes finite residue fields; it does not
already construct general imperfect-residue Kato theory. HL.4 is the nearest
ramification overlap and must import the reusable theory once, rather than
acquire a second filtration. Generic nearby-cycle formalism is not itself the
Bloch–Kato p-primary graded-piece theorem. Local invariants and global
reciprocity are imported from upstream Class Field Theory.

The rejected briefs are retained as revision material, with explicit review
gates. Their source statements must not be treated as established implementation
contracts until the review requirements are met.

## Source findings

E1–E7 were independently checked; E8–E14 were added by the reviewer. The JSON
contains each locator, correction, argument, bounded novelty search and verdict.

- E1: zero differential in the printed projective-space basis.
- E2: unramified restriction indexed by fil_n instead of fil_{n+1}.
- E3: unused quantified r in Lemma 9.5.
- E4: the proof of Corollary 9.8 needs the nonzero β component, not merely nonzero rsw.
- E5: the Proposition 10.8 witness fails at e′−1, not the printed e′.
- E6: choose a totally ramified degree-p extension; “wildly ramified” alone does not pin the required residue behaviour.
- E7: the 2023 introduction overstates the ordinary-prime implication; the 2025 sequel resolves the general question.
- E8: degree indices in Lemma 2.12 and the degree-two Brauer identification.
- E9: the fractional-differential recipe and O_K-valued residue sequence in §2.3 are invalid; use the formal log point.
- E10: the blowup coordinate formula needs an origin or a difference of coordinates.
- E11: Lemma 8.4's refined conductor requires positive output level.
- E12: Lemma 8.11's conductor bound cannot be imposed on the original model as written.
- E13: Lemma 10.1 needs K×, not only units.
- E14: the surjective-evaluation test needs n>1 for proper inclusion.

These findings do not assert counterexamples to Theorems A–D. In particular,
E12 requires proof repair before certifying the strengthened evaluation formula.

## Work remaining

Split bundled conclusions and construct a source-to-item proof-dependency ledger,
including named results imported inside proofs. Important omitted inputs include
the cohomological Brauer definition/comparison, all-degree cups and edge-map signs,
the Kato residue complex, blowup/Rees and projective differential geometry,
trace nondegeneracy, ordinary vanishing-cycle comparison, Picard and Hodge
theory, higher-dimensional semicontinuity, and Fontaine–Messing/Deligne–Illusie.

The 13 prerequisite entries are a bibliography, not an assertion that their
required theorems have all been independently read or supplied. Select exact
source statements and owners for each use. Do not replace missing generality
by a curve-only or invertible-coefficient special case.

## Validation

The paper checker passes. The paper, source-issue and paper-queue regression
tests pass. Additional checks verify all 109 missing items are routed exactly
once, 14 source verdicts have the correct reviewer, the four library items cite
pinned declarations, and finite diagnostics catch the origin and trivial-class
edge cases. No Lean file is part of this review and no Lean compilation is claimed.
