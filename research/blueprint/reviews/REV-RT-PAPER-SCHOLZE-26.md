# Verification of RT-PAPER-SCHOLZE-26

Codex, session `codex-J6LwjP`, 30 September 2026. Issue #4255; claim confirmed
by the bot against comment 5912727357. Repository base: `141668a`.

All ten findings are **confirmed**, with the qualifications below incorporated
in the machine-readable reasons. The seven high/medium findings warrant fixes;
the three low findings concern two omitted source-misprint records and partial
library pointers. This review does not change the extraction or its owners.

## Independence and evidence

The extraction, original review and red team name sessions `cc-39fac3`,
`cc-7b31c4` and `cc-f805bf`, respectively. I did none of those jobs. I read the
ten findings, their report, the extraction's six routes and prerequisites,
affected items and source issues, and the original review. This verifies those
findings, not a second complete extraction of all 65 pages.

The primary text is [arXiv:2412.03382v3](https://arxiv.org/pdf/2412.03382v3),
22 January 2026, downloaded on the review date. Its SHA-256 is
`440b4a82eca992d1b7edb5c608bd7de8c336cce7f623f290aa95002cab57d484`,
matching the extraction and red team. I read the relevant definitions and
arguments on pp.7–9, 12–13, 16, 23–24, 34–38, 47–50, 52–55, 57 and 63.
Pages 34, 35 and 38 were also rendered and read as images, to distinguish bars,
indices and exponents from text-extraction artifacts.

For the source-misprint search, the [arXiv history](https://arxiv.org/abs/2412.03382)
still lists v3 as latest. The [author's papers page](https://people.mpim-bonn.mpg.de/scholze/papers.html)
lists no correction with this paper. The [author PDF](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf),
SHA-256 `23a34fdedb928bf43b6d8fad58cc4a4652d2dfdeeeb429a0aabdbc44b17b53c9`,
retains the formulas in /8 and /9 on its pp.35 and 38. Crossref's record for
`10.1090/jams/1068` has no `update-to` or relation and its `updates` query returns
zero works. Attempts to open the journal article and DOI failed. I have not
compared the journal text or the v1/v2 texts; the findings concern v3, not an
unread version of record. A new errata record must list these actual searches.

I read the relevant roadmap descriptions, current packet statements, accepted
paper routes and `make_queue.py`'s route filter, and opened
[DESIGN-MotivesAndAlgebraicCyclesPartII #3463](https://github.com/CBirkbeck/tauceti-explorer/issues/3463).
Its body supplies only Scholze's continuation. The verification uses current
review and queue state, not an independently reconstructed chronology of the
old commits.

## Routing and coverage

**/1 — confirmed, high.** BKV's review rejects its route 13 and has overall
verdict `revise`. `accepted_routes` therefore contributes none of its routes.
Scholze's live design nevertheless tells the designer to keep the other
brief and reuse its RigDA layers. That is an unsatisfied dependency. Supply a
self-contained Berkovich brief and correct items 17, 27, 44, 50 and 52. Preserve
the actual endpoints, including the six operations, rigidity, algebraic
comparison and nearby cycles. Remove logarithmic scope unsupported by this
paper. An eventual RigDA supplier and comparison may be imported once actually
planned; they cannot be inferred from a rejected route. Queue regeneration
should carry the corrected brief to the pending design.

**/2 — confirmed, medium.** `AnalyticStacks` AS.0 expressly includes the extension
to stacks cited on p.52; AS.1 includes the topological formalism used in the
complex case on p.50. Its README excludes motivic Lectures XI–XII. The correct
boundary is therefore an import of those abstract/topological inputs, with the
Berkovich construction and its hypotheses still to be proved. The accepted
Bhatt–Mathew extraction already supplies `ArcTopologyAndDescent`; update the
uncovered-prerequisite list without conflating its scheme site with the
Banach-ring site. The full items do not become planned merely from importing
these antecedents.

**/3 — confirmed, medium.** M.5a's Nisnevich sheaves with transfers and the
MC.4 packet's bounded-above triangulated Nisnevich category are not Remark
11.2's presentable stable category with étale descent. Assign the latter an
explicit single owner, with item 49 missing until such a plan exists. Import
usable transfer/cancellation work with its actual hypotheses. The enhancement,
étale localization and any comparison with a with-transfers model are separate
proof obligations. Retain the algebraically closed discrete-field setting of
Proposition 1.13 / Theorem 11.1 and the paper's warning about descent versus
hyperdescent when extending beyond it.

**/4 — confirmed, medium, with updated packet evidence.** The paper uses support
completion on p.47, torsion rigidity on p.48, and valuation-ring invariance plus
cdh/pro-cdh arguments on pp.49–50. The current S.5 packet has **34 nodes**, not
one; I checked their statements for these inputs. Its homotopy-invariance node
still requires a regular noetherian scheme, and its new projective-bundle and
blow-up nodes do not supply the missing results. S.3's support-excision scope
is an appropriate home for the completion input, with the relevant hypotheses
proved explicitly.

LMMT's accepted item 93 note sends KH excision and descent to its general
K-theory continuation. However, item 90 actually states a theorem for
**K(1)-local K-theory**, not the theorem for KH. The fix should make the shared
general KH result explicit in that supplier, not substitute one invariant for
the other. Split the remaining inputs and request them from the appropriate
scheme K-theory continuation. Keep the nonnoetherian valuation-ring scope and
noetherian approximation where used. The two descent proofs on p.49 are
alternatives; record that choice rather than introducing an artificial need
to finish both before the application.

**/5 — confirmed, medium, with updated packet evidence.** E5:presentability now
has six nodes (compact objects, Ind-completion, its universal property, stable
Ind, presentability, and coherent group actions). None supplies the compactly
assembled theory required by Definition 2.7 / Remark 2.8, Proposition 10.3,
Lemma 10.5 or the discussion on p.63. A request to E5 for the general theory
is the clearest repair, with the Berkovich and RT.5 applications importing it.
Do not equate dualizable **objects** in RT.5 with dualizable **presentable
categories**. Split item 47 and explicitly locate/request its other inputs,
including tensor inversion, quotients, monadicity and descendability, instead
of treating an E5 layer title as proof of every needed theorem.

**/6 — confirmed, medium, with ownership and source qualifications.**

- De Jong's [Theorem 4.1, p.66](https://www.numdam.org/item/PMIHES_1996__83__51_0.pdf)
  gives an alteration and a regular projective compactification with strict
  normal-crossing boundary; over the algebraically closed field in use,
  regularity gives smoothness. L5 explicitly owns this input. Record the
  proper, dominant, generically finite alteration and boundary control,
  rather than claiming resolution without alteration.
- Lemma 6.4 first permits shrinking the curve around the two points. I opened
  van der Put's [Theorem 1.1 and Corollary 1.3, pp.156, 159](https://www.numdam.org/article/AIF_1980__30_4_155_0.pdf)
  and rendered p.159: the corollary concerns the **reduction** of a normal
  connected affinoid inside a complete nonsingular curve. Its finite set of
  missing reduction points is not the assertion that the analytic complement
  itself is a finite point set. Record the passage to the shrunken finite-disc
  situation, then the separate generalized Jacobian with trivializations at
  chosen boundary points. Multiplication by a prime is surjective on its
  algebraically closed points, including residue characteristic; separability
  of that multiplication is not required. Reuse ordinary Jacobian work and
  coordinate with R11.4's generalized-Jacobian scope; do not assume its
  semistable-curve statement automatically gives the marked-point theorem.
- [Mondal–Reinecke, Theorem A and Corollary 3.26](https://www.math.purdue.edu/~mondalsh/papers/postnikov-completeness-replete-topoi.pdf)
  supply the hypercomplete replete-topos result used on p.24. E2 already owns
  repleteness and derived Postnikov convergence. Its E0 packet has
  `E2/replete-topoi`, `E2/left-completion`, the Postnikov unit/counit, and a
  space-level convergence node with the stronger locally weakly contractible
  hypothesis. Request the precise general extension there; the Berkovich
  application must verify its arc-site is replete. Do not duplicate the
  abstract theory in the motivic continuation or omit hypercompletion.

## Formula checks

**/7 — confirmed, medium.** On the rendered p.34, the top row is
`Sym^n(G_m) ≅ A^(n−1) × G_m`; only the lower row has bars. Replacing a root by
a nontrivial 1-unit multiple changes a polynomial coefficient, so those
coefficients do not descend to the barred input claimed by item 22. The lower
multiplication map has the stated property after ball localization. Correcting
the row preserves the reduced free-motive conclusion.

**/8 — confirmed, low.** To keep every root in the open annulus, both the upper
root bound and the reciprocal-polynomial bound must hold. The displayed
`max` must therefore be `min`. A direct counterexample avoids any issue about
reading a Newton polygon: in an algebraically closed nonarchimedean field with
an element `α` of norm `2^(3/2)`, take

`(X−α)(X−α^−1) = X² − (α+α^−1)X + 1`.

For `r₁=1/2`, `r₂=4`, the printed bound on the middle coefficient holds, but
`|α^−1|=2^(−3/2)<1/2`. Using the minimum still gives an open polydisc for the
fiber, so this corrects the proof's formula without changing Proposition 5.19.

**/9 — confirmed, low.** At the outer boundary the product has norm
`|T|^n ≥ r₂^n`, with `|T| ≥ r₂ > 1`. At the i-th inner boundary the other
factors all have norm 1 because the centers have distinct residues; the bound
is `r₁^(k_i)`. Taking each `k_i` large, as the construction allows, proves the
intended statement. The four corrections belong in a source-issue record;
they do not require withdrawing Lemma 6.5. Both /8 and /9 are absent from the
extraction's existing E1–E3 records.

## Pinned library checks

**/10 — confirmed, low, as partial baseline only.** I read the declarations at
Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`, not a current branch:

| File | Read declarations and boundary |
| --- | --- |
| [Normed/Ring/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Normed/Ring/Basic.lean) | `SeminormedCommRing`, `NormedCommRing`; add `norm(1) ≤ 1` in both cases and `CompleteSpace` for Banach rings. |
| [RingSeminorm.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean) | `RingSeminorm`, `MulRingSeminorm`; the latter also preserves 1 and supplies the bounded multiplicative points of the planned spectrum. |
| [SmoothingSeminorm.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Normed/Unbundled/SmoothingSeminorm.lean) | `smoothingFun`, `tendsto_smoothingFun_of_map_one_le_one`, `isPowMul_smoothingFun`; the last signature has no nonarchimedean assumption despite the overview comment. The bundled `smoothingSeminorm` does require one. |
| [Condensed/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Condensed/Basic.lean) and [CompHaus/EffectiveEpi.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Category/CompHaus/EffectiveEpi.lean) | `Condensed`, `CondensedSet`, `effectiveEpiFamily_tfae` give the ordinary coherent site and finite jointly surjective families. They do not prove the Banach-site equivalence for anima. |
| [ContCohomology/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean) | `continuousCohomology n A` is homogeneous-cochain cohomology for `TopRep k G`. It is a classical starting point, not the derived condensed fixed-point comparison of Proposition 4.15. |

The norm condition must allow the zero Banach ring. The classical cohomology
pointer needs an explicit comparison with discrete continuous modules and the
derived condensed construction; it cannot certify the whole item as built.
Keep item 4 **planned** at TB.0 and items 1, 5, 9 and 14 missing, with their
partial pointers. I also read the cited real/complex Gelfand–Mazur declarations
and the relevant reviewed library-coverage entries; no additional library
completion claim is made, and no new Tau Ceti declaration is asserted.

## Validation

The review contains exactly one decision for each of the ten finding IDs.
The red-team review checker, intake deliverable-path check and `git diff
--check` were run for this submission. No packet, roadmap, extraction, checker
or source-issue register was edited. No Lean compilation was attempted: this
is a review-only job, with no existing pinned build established for the session.
