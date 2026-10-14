# PKG-HodgeTateAndCanonicalSubgroups

Issue #9770; Codex, session `codex-u7tIH6`; 2026-10-14.

## Delivered

The package has a README, Suggested.lean and one-line `math.NT` metadata. It
packages the accepted assembly and its T0/T6 supplements without editing any
packet, reader, suggested input, atlas or upstream file. The README is the
full mathematical deliverable: 137 targets in nine layers, with the original
statements, hypotheses, proof routes, sources, prerequisites, acceptance
checks and examples. It retains 411 named API entries and 224 named unit
tests; every one of the 22 definitions has at least three discriminating
tests. The per-layer target counts are 23, 3, 13, 10, 8, 12, 31, 36 and 1.
Internal target references become numbered sections with explicit anchors.
Supplier requests become mathematical contracts, without programme status
information. Further contracts preserve the accepted plan's unresolved
inputs rather than claiming their suppliers have proved them.

The Lean file is 242 lines and imports Mathlib only. It keeps real-bodied
compact-open level indices, numerical bounds, the matrix coordinate and
automorphy factor, and a ring-level log condition. Its examples distinguish
weak from strong bounds, the small-prime constants, a translation from the
Weyl action, and units from the one-element monoid. Five proposition-valued
milestones use `sorry`; no data definition does. Geometric definitions and
comparisons remain README targets because their carriers are unavailable at
the elaboration pins. This is a complete package submission, not an assertion
that the proposed mathematics or its external supplier extensions is
formalised or independently closed.

## Checks

- `lean-check research/blueprint/packages/HodgeTateAndCanonicalSubgroups/Suggested.lean`
  exited 0. Its only diagnostics were five `declaration uses sorry` warnings,
  at lines 41, 102, 130, 135 and 199. The numerical and matrix examples elaborate.
  Available memory was checked before compilation; no build, cache download,
  dependency update or language server was started.
- Elaboration pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
  Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- `python3 scripts/check_blueprint.py` on each of
  `research/blueprint/packets/HodgeTateAndCanonicalSubgroups.json`,
  `research/blueprint/packets/HodgeTateAndCanonicalSubgroups--T0.json` and
  `research/blueprint/packets/HodgeTateAndCanonicalSubgroups--T6.json`: no
  errors or warnings. The packets are unchanged.
- A section-by-section inventory check against all three packets and the
  assembled reader finds all target declarations, all 411 API names and all
  224 test names in their corresponding README section. All 137 section
  anchors and internal target links resolve. Definition test counts pass.
- Package data-body check, intake path/content check, metadata parse and
  staged whitespace check pass on the four deliverables.

## Existing-library boundaries

Read the current upstream roadmap tree, including the nine post-snapshot
roadmaps and Completed roadmaps, and current Tau Ceti. AdicSpaces and
ReductiveGroups supplied the full README style models; their suggested
files supplied the compact signature style. No upstream files were changed
and no Lake command was run in the read-only environment.

Current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already has
`TauCeti.fittingIdeal`, its finite-free-presentation formula, congruence and
base-change API. The package cites these declarations and does not plan a
second general affine Fitting-ideal theory. They apply to finite modules over
commutative rings. The scheme gluing and nonnoetherian valuation-ring
presentations remain distinct requirements. This current API is newer than
the elaboration pin, so Suggested.lean does not import it.

Current `TauCeti.RestrictedProducts.CompactOpenSubgroups` is a chosen family
of compact open subgroups of factors. The package's lightweight subtype is
the poset of all compact open levels of one group, with intersection cones;
it does not duplicate restricted-product constructions. Mathlib's module
Grassmannian is the finite-projective-quotient/rank-at-stalk interface, not
an already represented geometric flag scheme. Current ReductiveGroupsPartII
covers local structure and arithmetic models; the exact filtered-Tannakian
extension stated here remains additional to it.

## Source checks and small corrections

Downloaded 23 freely readable author/arXiv/publisher PDFs in disposable
scratch. Their hashes agree with the assembly's named source versions.
Neither PDFs nor extracted passages are deliverables. Citations and
mathematical statements are in our own words. These spot checks verify
specific applications, not every prerequisite theorem or the complete
contents of each source.

Read the following passages directly, among others:

- FAR10 Definition 3, p. 7; Definition 17, p. 25; Theorem 7, p. 26;
  FAR11 Theorem 6, pp. 38–39. These fix Fitting degree, the direction of the
  character map, the odd-prime finite bound and the strict HN constants.
- Scholze's CDM survey Theorem 4.13 and Remark 4.14, pp. 27–28;
  Proposition 4.15, pp. 28–29. They supply the integral complex and the
  good-reduction Kummer/character comparison, respectively.
- SCH15 v2 Theorem III.2.1 and Corollary III.2.2, pp. 31–32;
  Corollary III.2.6 and Definition III.2.7, pp. 33–34. The lifting
  consequence is a **corollary**, not a lemma. HALO Proposition A.1,
  Lemma A.2 and Corollary A.2, pp. 37–40, give the all-prime small radius.
- AIPH Proposition 4.1, p. 15; PS16 Theorem 1.9 and Remark 1.10, p. 5,
  Lemma 1.12, p. 6. The modified-lattice p=2 exponent remains conditional
  because the primary source reports an unwritten estimate.
- BHW v4 §§7.1–7.2, pp. 28–30, and published Propositions 5.18–5.19,
  pp. 1751–1752. Integral unsplit generators and the larger inclusive
  endpoint remain separate supplier requirements. The radius containment
  is used only in its valid direction; torsor membership comes from two
  actual lifts. PIL20's supersingular example, p. 48, and BCGP21's
  boundary construction, pp. 140–141, were also checked.
- CS17 v1 Theorem 2.2.2 and Proposition 2.2.3, p. 14;
  Boxer–Pilloni Remark 4.4.23, p. 74, and Theorem 4.4.40, p. 80.
  The horizontal lattices, Tate-twisted Levi comparison and downstream
  toroidal perfectoid ownership are kept separate.
- Ziegler Theorems 3.14–3.15, p. 17; Lemma 3.23, p. 18;
  Theorem 3.52, pp. 27–28. Algebraic fpqc splitting does not by itself
  give the Shimura pro-étale type argument.
- DLLZ-adic Proposition 4.2.1, pp. 47–49; Lemmas 4.4.27 and
  4.4.29, pp. 64–65; Theorem 6.2.1 and Corollary 6.2.3, p. 85;
  Corollary 6.3.5, p. 89. Boundary root covers retain their boundary
  points; properness is retained for finiteness; exterior Kummer
  cohomology carries the appropriate Tate twists.
- DLLZ-RH Lemma 3.3.18, p. 32; Propositions 3.4.16–3.4.17,
  pp. 37–38; the relative residue argument, pp. 40–41;
  Appendix A.2.3.4, pp. 75–76. The Gauss–Manin locator in the added
  supplier contract is pp. 40–41, not pp. 44–46.
- ECD v4 Lemma 11.22 and Proposition 11.23, pp. 63–64: the tower
  topology and finite-stage descent have their qcqs hypotheses.
- Lan's author errata, p. 1: the boundary dimension exception remains
  part of the normalized-model contract.

One substantive correction to the assembly's conventions is made only in
the package: for a multiplicative group with **character** lattice T,
`ω_G = T ⊗ ω_μ`, so the determinant factor is `det T`, rather than its
inverse. Normalization is performed on the lattice over Z_p before base
change, so it still makes sense over a base with nilpotent p. The degree
duality slope formula now explicitly requires positive height, and the
p-divisible truncation slope formula also requires positive level. The
trivial group is added as a zero-height negative control. Packets were not
edited; the maintainer can propagate these corrections to the inputs.

## Inputs still requiring supplier closure

The accepted assembly carries 23 gaps and 25 requests. Packaging does not
erase them. The README preserves their precise assumptions as supplier
contracts or conditional variants. Resume from the corresponding named
contract and the packet's `gaps`/`requests`, rather than treating an owner
name as evidence of an existing theorem:

| Input | Where to resume |
| --- | --- |
| Group co-Lie deformation/trace duality | R07.6 and DD.0: full obstruction functoriality, syntomic amplitude and determinant/trace compatibility. Illusie II was not cleared; Scholze's restatement and HALO's application do not independently verify that foundation. |
| Valuation Fitting/Faltings complex | R07.1 and StableReduction: valuation cyclic presentations, O_C conormal reduction and exact finite-to-p-divisible embedding hypotheses; reuse current affine Fitting API. |
| Boundary one-motives/Raynaud | C4 and R11.3: polarized full-height one-motives and arbitrary-C realization beyond the DVR statements. |
| Normalized PEL model/descent | C5: exact ramified GSp4/F model, coefficient presentations, dimension exception, mod-p^k projection formula and norm descent. C6 is not a replacement. |
| Relative character/tensors | P8 and B1: two horizontal lattices, relative Kummer compatibility, rational defining tensors and central-μ Tate contraction. General-C families and integral frames are additional variants. |
| Filtered Tannakian/flags | ReductiveGroups extension and R09.1/B0: strict exact filtered functors, fpqc splittings, represented parabolic/flag/Levi torsors; keep pro-étale type separate. |
| Hilbert endpoint/generator | H2/H4: larger p≥3 inclusive endpoint and unsplit O_F/p^n dual generator. HALO only independently supplies the small all-prime radius. |
| Integral matrices/level models | R2/H4: normal models with compatible generators and matrix/inverse-preserving O+ transfer; lattice independence needs inclusion and determinant cancellation. |
| Modified images/small prime | R2/C4/C5: strict images after minor modifications, placewise coefficient presentations; verify the PS16 p=2 boundary estimate before removing its condition. |
| Siegel consumer refinement | O8: read DRW §3.6 and specify the additional p>2g domain comparison. This is beyond the present assigned general targets. |
| Canonical formal model | R2: identify common normalized models before strengthening an adic finite-étale section to a formal isomorphism. |
| Open relative filtration transfer | P9 and R09.1/B0: completed pullback on test untilts and effective frame/Levi descent, upstream of perfectoid representability. |
| Early ordinary primitive stage | P8: expose Theorems 4.9/5.1 and Lemmas 4.12/5.3–5.9 of Scholze 2013 in the intended primitive stage after local rational periods. That stage is not yet materialized. |
| Analytic extension/resolution | Supply Hansen finite-normal-cover extension, Lütkebohmert root extraction, Bartenwerfer bounded extension and rigid resolution with the proper-space/Zariski-open hypotheses. |
| General Banach decompletion | PerfectoidSpaces extension: weak/stable systems, uniform twists, Tate–Sen coefficients and finite-projective gluing, before the logarithmic tower instances. |
| Arithmetic group instances | ArithmeticLocallySymmetricSpaces extension: precise density, superrigidity and congruence hypotheses for the groups used in DLLZ-RH §5.6. |
| Rigidity embeddings/descent | V8.general: both Piatetski-Shapiro embeddings, nontriviality on simple factors and special-point descent. |
| CM special points | Early CM abelian comparison supplier: potential good reduction, crystalline Hodge tensors and Faltings/Scholze compatibility. Do not route through the late MC.7 cycle. |
| Derived pro-Kummer limits | Supply the exact basis-acyclic inverse-limit vanishing theorem; do not assume this site is replete. Generic D0 site operations are already cited. |
| Ordinary Liu–Zhu theory | Ordinary prefix of the comparison direction: interior RH/de Rham functors, pullback, tensor and rigidity, including canonical local systems being de Rham. Its owner is not yet accepted. |
| Further classical inputs | Provide separate interfaces for algebraic/analytic étale comparison, purity, regular-singular extension/analytic full faithfulness, codimension-two extension, Gauss–Manin residues and relative Z_p-local-system finiteness. |
| DLLZ published collation | Findings refer to hashed author versions. Collate with the published chapter before alleging a version-of-record error; the subscription preview is insufficient. |
| Horizontal coefficient frames | P8 local-rational: multivariable integrable coefficient-connection recursion and compatibility with filtration completion after inverting t, beyond the untwisted Poincaré lemma. |

For the next independent package reviewer, the priority is the conditional
contracts and dependency ownership, then the preserved target hypotheses.
There is no further packaging task left in this run and no second issue was
claimed. Scratch sources and conversion scripts are disposable; this note
contains the information needed to resume any mathematical supplier work.
