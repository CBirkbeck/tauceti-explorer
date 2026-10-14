# PKG-ModularCurvesPartII — completed package

Issue: #9739. Worker: Codex, session `codex-iHI4xZ`. Date: 2026-10-14.
Claim confirmed by the swarm bot in
[its reply](https://github.com/CBirkbeck/tauceti-explorer/issues/9739#issuecomment-6170992435).
This is the package submission, not an independent review or a claim that the
mathematics has been formalised. No packet, reader document, assembly or atlas
data was changed. The next job is the independent package review.

## Deliverables and coverage

- `research/blueprint/packages/ModularCurvesPartII/README.md`: the mathematical
  roadmap, with conventions, exact supplier contracts, 17 ordered layers,
  target statements, APIs, discriminating Checks, worked examples and sources.
- `research/blueprint/packages/ModularCurvesPartII/Suggested.lean`: 398 lines;
  17 light definitions with real bodies, representative signatures, examples
  and negative controls. Heavy geometric carriers remain README targets and
  are named in the closing comment. No sorry'd data or construction is used.
- `research/blueprint/packages/ModularCurvesPartII/metadata.toml`:
  `topic = "math.NT"`.

The six accepted input packets have 160 target nodes altogether. The README
retains 158 and imports two existing results, listed below. R13.4 and R13.4b
own no nodes; their contracts, comparison requirements and recorded gaps were
also read. All retained definition/construction APIs and tests were checked
against the input nodes. Every such target has at least three Checks. The
assembly's worked examples and source corrections are retained with the
necessary hypotheses. The layer layout is:

| Layer | Targets | Input stages represented |
| --- | ---: | --- |
| 1, lattice uniformization | 5 | R12.1 |
| 2, generalized elliptic curves | 11 | R13.1 |
| 3, integral levels and open comparison | 15 | R13.2, R13.3, R13.4a, R12.2 |
| 4, formal cusps and pairing components | 12 | R13.3, R12.2–R12.4, R13.2 |
| 5, integral coarse curves | 21 | R13.4a, R13.3 |
| 6, compact comparison and twists | 5 | R12.3–R12.4 |
| 7, Hodge and Hecke pairing | 6 | R12.5 |
| 8, descent | 5 | R12.6 |
| 9, correspondences and quotient curves | 13 | R14.1, R13.4a |
| 10, generic compatibility | 4 | R13.4b, R14.1 |
| 11, bad fibres and explicit models | 8 | R13.5 |
| 12, modular degeneration | 4 | R13.6 |
| 13, Jacobians and Hecke | 6 | R14.2 |
| 14, cohomological realizations | 15 | R14.3; R14.2 realization comparison |
| 15, Ihara | 10 | R14.4 |
| 16, modular abelian quotients | 8 | R14.5 |
| 17, bad-prime and Taylor–Wiles interfaces | 10 | R14.6 |

The R14.2 integral-Hecke realization comparison is §14.15, after the actual
symbol and Tate comparisons (§§14.12–14.13), rather than a forward dependency
in Layer 13. The integral curves are constructed before their analytic
comparison. Connectedness precedes the irreducibility of paired twists.

## Existing work and ownership

The read-only current TauCetiRoadmap checkout was inspected at
`0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. DifferentialGeometry and
AlgebraicVectorBundles READMEs were read in full as shape models. ModularCurves
and ModularForms contracts were checked against their current roadmap text.
The nine post-snapshot roadmaps and the four named Completed roadmaps were
searched for the mathematical objects used here. Their general vector-bundle,
manifold, profinite and topological results are suppliers, not new targets.
The reviewed library audit for this roadmap was also read.

Two duplicate target nodes were removed from the layers and imported in the
supplier/boundary discussion:

| Input node | Existing owner and exact scope |
| --- | --- |
| R13.4a/finite-normal-recognition | ModularCurves Layer 10, item 1: a normal scheme finite over the j-line is recognized from its schematically dense open generic cover, with that open meeting every component. Properness and normality alone are insufficient. |
| R14.6/diamond-group-ring-local | Current Tau Ceti `TauCeti.MonoidAlgebra.isLocalRing_of_isPGroup` and `isLocalHom_lift_one_of_isPGroup`: the finite commutative ℓ-group over local O with ℓ nonunit, together with the native augmentation and its kernel generators. This module is beyond the compilation pin and is therefore a current-library import, not an import in Suggested.lean. |

The actual compilation pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Cited baseline declaration
statements were read at these pins, including their hypotheses. In particular,
the native cusp-width carrier is GL₂(ℝ), and the locally constant finite rank
statement requires a finite flat morphism locally of finite presentation.

This roadmap is tier 11. Suppliers are at lower tiers or existing upstream
roadmaps. FoundationsAndLibraryIntegration bookkeeping was replaced by its
actual declaration or owner; no `UPSTREAM:` placeholder remains. The generic
tree/local amalgam is ReductiveGroupsPartII RG2.2.4 and strong approximation is
AdelicAlgebraicGroups AA.4. The modular arithmetic stabilizer calculation
remains here. The relative curve Jacobian is JacobianChallenge Layers D/F;
the relative integral norm contract is stated separately. Stabilization is
StableReduction Layer 8 (genus at least two), or Layer 9 with markings, not
its semistable-existence Layer 7.

No quaternionic theorem is imported upward from HilbertAndShimuraCurves. The
specific model-to-graph and integral Hecke comparison required for the pivot
is explicitly an additional geometric input in §17.6; the exported sequence
is conditional until that input is supplied. No ownership move into a new
higher-tier prerequisite is claimed.

## Mathematical corrections and adversarial checks

The accepted packets were left unchanged. The package resolves the following
ambiguities or mistakes instead of repeating them:

- Pullback of an open level subgroup leaves the projective index unchanged
  but changes the determinant image to its full inverse image. Reduction from
  level one to level five detects the incorrect determinant claim.
- Keep full frames, fixed pairing, projective frames, point level, naive
  cyclic level and refined cyclic level distinct. In particular full level
  one is not a representable cover of the elliptic stack, Γ₀ has generic
  inertia, and the Γ₁(4) characteristic-two coarse-base-change counterexample
  survives. A proper ramified rigidifier is not a universal elliptic curve on
  the coarse curve.
- A proper Tate power map has node fibre of length 2m−1 and is not finite
  flat there. The square-map fibre basis is 1,x,y. Full/cyclic HNF branch
  counts are σ₁(m) and ψ(m); m=4 gives seven and six, excluding exactly the
  scalar branch (2,2,0) from the cyclic correspondence. Composite-level
  transport includes the diamond in the scalar branch.
- Distinguish strict and effective cusp widths, including irregular cusps.
  The lattice cubic uses a₄=−g₂/4 and a₆=−g₃/4. Its curve differential is dz;
  the modular Hodge frame is 2πi dz=du/u. Tau Ceti's pairing convention gives
  e(τ/N,1/N)=ζ and the reversed pairing ζ⁻¹. The analytic row action is
  matched to that ordered basis.
- Distinguish upper and lower Jacobian Hecke actions and their cotangent
  transpose. The integral coherent operator is pT_p; Jacobian norms and
  étale traces are unscaled. Constant q-coefficients, bad-prime diamonds and
  characteristic-p inseparable trace lengths are retained. Fricke requires
  nonzero N and z; the totalized formula at N=0 detects a lost hypothesis.
- The characteristic-three Tate normal form with a₁=0,a₃=1 is singular:
  Δ=a₃³(a₁³−27a₃). Lifting p-power level first chooses Q′ with
  p^(r−e)Q′=Q and tests the lifted Drinfeld structure, not Q as a generator
  of the larger group.
- The split-Cartan semistable formula concerns the normalizer curve X_s⁺,
  not the ordered split-Cartan curve. Its chosen root at ℓ=13 has exponent
  84; squaring the root equation is weaker data. Component genera plus the
  graph cycles give genus 3 at ℓ=13 and 45 at ℓ=37. The first Baran quartic's
  smoothness at 2 is checked on affine and infinity charts, including the
  required finite-field polynomial coprimality calculation.
- Graphs retain loops, multiple edges, genera and thicknesses. Two vertices
  with s edges have rank s−1; ramified base change multiplies thickness.
  The singular node uv=ϖⁿ is not regular when n>1.
- Integral Sym^r self-duality needs r! invertible or its compared
  divided-power dual. Nonconstant cusp coefficients use boundary circles
  and monodromy. A parabolic image need not be saturated: multiplication by
  two over ℤ is the negative control. Full modular symbols are not compact
  cohomology; the cuspidal kernel, torsion and the dual coefficient matter.
- The ordinary principal-level Ihara kernel consists of congruence classes;
  finite codomain alone does not imply congruence. Γ(3) with F₅ coefficients
  gives a noncongruence control. Ribet's fine compact Γ₁ theorem permits
  every coefficient prime, including primes dividing N; Γ₀ instead has the
  anti-diagonal Shimura kernel. The selected-root determinant is
  (q+1)²−T_q². CDT's level-five invariant calculation uses F₅, correcting
  its printed F₃.
- The pivot Jacobian is quaternionic J′_pq, not the ordinary modular J_pq.
  The Taylor–Wiles cover keeps the fine auxiliary level at both ends, uses
  ξ=diag(−1,1), and takes minus cohomology. The projector needs the actual
  inverse of two; characteristic two makes identity equal to negation and
  invalidates the complementary decomposition. Freeness over O[Δ] does not
  assert Hecke rank two or multiplicity one.

These are mathematical checks of this package, not a red-team or review job.

## Source audit

Sources are cited in original mathematical prose, with theorem/section and
page numbers. Public PDFs were fetched into disposable scratch; no source
passage or private source file was copied into a deliverable. The supplied
library index was read; no uncleared book copy was used. Public source
versions were compared with the input SHA-256 fingerprints where supplied.
The reference list distinguishes the preprint and published pagination.

The following passage/locator checks provide a reproducible sample larger
than the package-review minimum; they are not a claim to have reread every
page of every long source:

| Source version | Locations read and checked |
| --- | --- |
| Conrad, generalized elliptic curves, 18 July 2006, 49 pages | §4.4, Theorem 4.4.3, pp.42–45; chart, contraction and Γ₁ boundary statements |
| Česnavičius, arXiv:1511.07475v2, 5 October 2017 | Lemmas 2.1.6/2.1.11, pp.7–8; §4.3 full-level geometry, including N=1 exception; coarse construction and degree in §§6.1–6.4 |
| Česnavičius, published version | Printed pagination is PDF page plus 1998; the bibliography distinguishes this from the 67-page preprint |
| Česnavičius, coarse base change, 24 October 2016 | Theorems 2.1 and 3.2, pp.3 and 5, including the characteristic-two Γ₁(4) example |
| Conrad, classical analytic modular curves, course and q-expansion notes | Uniformization/Weil-pairing conventions, differential normalization and q-expansion hypotheses |
| Milne, Modular Functions and Modular Forms, v1.31, 22 March 2017 | §5, Lemma 5.13, Remarks 5.14–5.15, Proposition 5.16/Corollary 5.17, pp.72–74; §7 cusp/descent statements |
| Deligne–Rapoport, IAS Number 22 scan | II 1.10, pp.177–178 and 1.20, p.184; polygon/automorphism conventions; first PDF page is printed p.143 |
| Bakker–Tsimerman, arXiv:1403.7168v2, and published Annals article | §§2.1–2.2, preprint pp.5–6; §2.5, preprint pp.7–8 / published pp.716–717; the correspondence degree and component-coordinate corrections are retained |
| Bakker–Tsimerman erratum | Its Proposition 14/26 asymptotic corrections do not correct the subgroup-degree or component-coordinate issues |
| Ribet–Stein, author revision 23 November 2010 | §5.1 and §5.2, pp.69–74, especially Theorem 5.14 p.73; §3.10.2 equation (3.2), p.48; printed page is PDF page minus four |
| Balakrishnan–Dogra–Müller–Tuitman–Vonk, Annals 189 | Theorems 6.5/6.6, pp.928–929; Corollary 6.7 p.929; first Baran model p.930 |
| Masser–Zannier, Annals 191 | §3.1(ii),(v), pp.645–646: full/cyclic correspondence counts |
| Deligne, Bourbaki 355 | §§3.9–3.20, pp.154–160; printed Corollary 3.2 following §4.1, p.161; rational coefficient realization and duality |
| Ribet, ICM 1984 author scan | Theorem 4.1, Corollary 4.2, Theorem 4.3, pp.510–512, checked visually: compact Γ₁ injectivity versus the Γ₀ Shimura kernel |
| Calegari–Dimitrov–Tang, author PDF dated 18 September 2024 | §§4.4–4.6, preprint pp.27–34, especially Theorem 4.5.2 and the level-five invariant calculation; no unverified journal-page alias is cited |
| Calegari–Geraghty, arXiv:1207.4224 | Lemma 9.6 and Remarks 9.7–9.8, pp.88–90; determinant and root-control hypotheses. Unchecked Springer-layout PDF page aliases were removed |
| Serre, Arbres, amalgames, SL₂, Astérisque 46, third edition 1983 | I §4.1 Theorem 6 p.48; II §1.4 Theorem 3 and Corollary 2 p.110; II §2.8 Proposition 13 and amalgam example pp.168–170 |
| Serre, congruence problem, Annals 92 | §2.6 Theorem 2 and Corollary 3, pp.498–500, including the real/nonarchimedean specialization |
| Taylor–Wiles, author PDF 7 October 1994 | Proposition 1, pp.7–8: actual finite auxiliary cover, minus eigenspace, group-ring freeness |
| Funke–Millson, arXiv:1108.5309, retrieved author PDF dated 27 August 2021 | §2 p.8; Lemma 3.8/Remark 3.9 p.12; Proposition 3.11 p.13: boundary coefficients and pairings |
| Shepherd-Barron–Taylor, author Klein.pdf | Lemma 1.1 p.3: the cyclotomic-determinant F₅ twist and rational genus-zero conclusion, retaining the lifting/Hilbert-90 proof input |
| Caraiani–Newton, author Modularity-IQF.pdf | Proposition 7.1.3, PDF p.94: the named rational small-level curves and normalized coordinate input |
| Stacks Project | Tags 0363 and 03GV checked directly; no generalization beyond their statements is attributed to them |

Other source locators inherited from the accepted plan remain in the README;
the table records the independently rechecked passages, rather than treating
the existence of a matching PDF hash as proof of every locator. The reviewed
plan remains the input for the independent review's further source sample.

## Proof inputs that remain explicit

This is a plan for future formalisation. The input packets already record
mathematical gaps; packaging has not silently converted them into existing
library declarations. The main proof inputs requiring attention are:

1. §11.4: wild characteristic-two/three interior coarse rings, their modular
   resolutions, inertia, branch and thickness data. Tame invariant-ring
   resolution does not establish these cases.
2. §13.1: relative Picard norms and their polarization/trace comparison over
   ℤ[1/N]. A field-valued Jacobian theorem is insufficient.
3. §§14.12 and 14.15: the actual integral weight-two cuspidal
   Manin/geodesic comparison, with torsion removed and Hecke transpose fixed.
4. §§14.1–14.11: higher symmetric-power cusp monodromy, integral boundary
   eigensystems and the compared divided-power dual when r! is not a unit.
   Deligne's rational duality does not supply the missing integral comparison.
5. §15.3: the S-arithmetic congruence-kernel/Mennicke-symbol and Moore/class
   field calculation, with the precise real-place specialization.
6. §§15.2 and 15.9: the arithmetic fundamental edge and stabilizers, and the
   continuous SL₂ cohomology, Künneth/Hochschild–Serre restrictions,
   Lazard/adjoint calculation and reproducible level-8/16 computation.
7. §17.6: the specific Cerednik–Drinfeld quaternionic pivot model, graph and
   integral Hecke maps. Conditional exactness for supplied reduction tori is
   not an unconditional modular pivot sequence or an old/new isogeny argument.
8. §15.7: extensions beyond the actual fine weight-two compact Γ₁ result
   (coarse Γ₀, higher weight and characteristic-ℓ fibres) need their own
   hypotheses and comparisons. They are not consequences of that result.

The downstream-consumer section also preserves requests for the rational
X(ρ,5) interface, genus-zero X₀(4,9,25,49) and the four w₄₉ fixed points,
and the normalized small-level coordinates used by Caraiani–Newton. These
are stated as the required consuming interfaces; packaging does not assert
that the input nodes have already proved every coordinate calculation.

## Validation and next step

- `lean-check research/blueprint/packages/ModularCurvesPartII/Suggested.lean`
  exited 0 on the final file. Its only diagnostics were declarations using
  `sorry`; no errors or other warnings. Only the supplied shared pinned
  build was used; no library build, cache update or language server was run.
- `python3 scripts/check_blueprint.py <packet>` exited 0, with zero errors
  and zero warnings, for all six named input packets. Recorded gap counts
  are 0, 3, 0, 0, 9 and 6 respectively; those are input mathematical gaps,
  not validation errors or claimed closed proofs.
- Mechanical coverage checked 158 retained targets, all original API names
  and definition/construction Checks, all 17 light-definition names in the
  README, all 52 definition/construction target names in the Lean closing
  comment, and the absence of broken local anchors or forward subsection
  prerequisites.
- `python3 research/blueprint/intake.py check-files <the four deliverables>`
  exited 0: four files, zero problems. `git diff --cached --check` also passed.

Resume with the independent package review, reading the explicit proof
inputs above before assigning a verdict. This worker did not create
`review.json` and must not claim that review. Scratch is disposable; every
handoff fact needed by the next worker is recorded here.
