# AutomorphicGaloisRepresentations package, revision 3

Issue #9777; Codex, session `codex-6Qvxwm`; 14 October 2026.
Complete package revision, not a checkpoint. The next step is independent
package review. No second job was claimed.

## Completed repair

The remaining defect in `REV-PKG-AutomorphicGaloisRepresentations~2` was
the general regular-multiweight Hilbert ordinary-refinement character
comparison. Sections 4.10, 4.11 and 5.1 now provide an explicit intervening
comparison with exact inputs, rather than extrapolating Skinner–Wiles's
parallel-weight theorem or treating lattice saturation as a rational
filtration theorem.

- For canonical weight, the geometric subcharacter is the locally algebraic
  character `η∘rec_geom=νA`, with `A(x)=∏τ(x)^{-v_τ}`. All unit values,
  finite factors, the normalized uniformizer value, and the
  change-of-uniformizer law are specified. The arithmetic-dual quotient is
  `η⁻¹`, evaluated as `νA` on arithmetic reciprocity.
- Skinner–Wiles's global normalized operator includes factors from embeddings
  at other p-places. Divide out their unit-valued product to obtain the local
  root. The README gives a split-prime example over `Q(√13)` detecting this
  distinction. Unit operator `T_y` has coordinates `(y,1)`, hence representative
  `diag(1,y)` and Teichmüller multiplier 1.
- The rational-filtration proof imports the rank-one locally algebraic period
  comparison and the full coefficient-prime theorem. After twisting by η,
  the selected period line has slope zero and the other slope is positive.
  Weak admissibility forces its induced labelled degrees to be zero;
  admissibility, full faithfulness and finite Galois descent produce the
  required Galois line. The full WD parameter fixes its descent character.
  Coefficient-field actions are retained on the underlying Q_p-module.
- A four-row table transports subcharacters and quotient characters between
  `σ(π_SW)`, its arithmetic dual, `ρ_{π_SW}` and its dual. The determinant
  recovers the second character, including the central factor. Cyclotomic
  values at the coefficient prime use norm reciprocity: geometric value on
  a uniformizer is `Norm(ϖ)/q`, and equals 1 for `K=Q_p, ϖ=p`.
- An explicit norm-twist formula handles arbitrary central weight w, including
  negative twists. The unramified ordinary specialization requires vanishing
  local algebraic exponents and trivial finite unit factor. Finite twisting
  alone cannot kill nonzero labelled exponents.
- Section 5.1 consumes this rational comparison before intersecting with the
  fixed stable lattice. Saturation and flat extension retain the identified
  characters. General local comparison allows every totally real F and every
  p; the global finite-weight Skinner–Wiles construction retains its
  even-degree and odd-p restrictions.

Added `nearlyOrdinaryUnitValue`, a light finite-product coefficient expression,
and two proved examples to Suggested.lean. The examples detect loss of either
the finite factor or a nonzero labelled exponent. The period construction and
the eigenform filtration remain README targets, not purported Lean results.
All earlier review fixes are retained, including the generic polynomial
scaling boundary and rank-sensitive compatible-system hypotheses.

## Accepted-input correction to retain

The accepted inputs overload the central value `λ(S_x)` in the parallel
Skinner–Wiles determinant formula. The finite-level modified operator has a
finite-valued unit character. At weight greater than two it must be compared
with its algebraic specialization before representing the Galois central
character. Section 4.11 distinguishes these values explicitly:

`λ^alg(S_x)=λ(S_x)θ_SW(x)⁻¹∏τ(x)^{-µ}`,

where `θ_SW(x)=∏ω(x_v)^{-µ}` is the source's modified central multiplier.
The determinant on arithmetic reciprocity is `λ^alg(S_x)ε_p`, not the raw
finite operator value times ε_p. At µ=0 they coincide; at µ=2 a principal
unit with trivial smooth character has corrected central value `u⁻²` and
determinant `u⁻³`. This comparison is derived from the weight action and the
exact determinant dictionary, rather than attributed as a new explicit
formula in Skinner–Wiles (3.2). The packet was not edited, as required by the
issue. A future update of its character notation should preserve this
distinction as well as the global/local normalized-root distinction.

## Source and ownership verification

Fresh reading supporting this repair:

- Skinner–Wiles, original Numdam PDF: §3.1 pp. 27–28 (weight action and central
  exponent), (3.1′)/§3.2 p. 30 (inverse translation and normalized operator),
  p. 31 (selected local line), p. 32 (unit coordinates), Proposition 3.7
  p. 37 (algebraic specialization), (3.2)–(3.3) pp. 38–39. Its source form has
  central type `(k,−µ)`; the forward dual has type `(k,µ)`.
- Conrad, public author copy of *Lifting global representations with local
  properties*, Appendix B: Definition B.1 p. 32, Propositions B.3–B.4
  pp. 33–36 and Example B.5 p. 36. Read the rank-one degree and Frobenius
  arguments; the arithmetic/geometric inversions are explicit in the README.
- Colmez–Fontaine, public author PDF: Theorem A p. 2; §3.4 pp. 21–22;
  Proposition 4.2 and the subsequent period equivalence p. 23; Proposition 4.4
  p. 24. Read the relevant statements and arguments for the subobject
  inequality, full faithfulness and rank-one admissibility. Theorem A supplies
  the underlying Q_p-module formulation with commuting coefficient action.
- Skinner, original article: introduction and Theorem 1 pp. 242–244, including
  its full potentially semistable WD conclusion and normalization. No residual
  irreducibility or discrete-series assumption is added to this full theorem.
- Balasubramanyam–Ghate–Vatsal, public author copy: §3, internal pp. 7–8,
  for the independently visible labelled algebraic unit factor.
- Hida's original JAMI article, Theorem I(iv) p. 118, was read as background
  for filtration existence. It is not used to discharge the new normalization
  argument. No copy of Hida's uncleared 2006 book was read or obtained.

The generic rank-one comparison, weak admissibility and period-functor
contracts belong to PadicHodgeTheory R06.3; the README makes their consumed
interfaces explicit. Refined principal/special local models belong to
GL2AutomorphicRepresentationsAndTransfer R16.2. Local reciprocity and its
norm/cyclotomic formulas remain with ClassFieldTheory and current
LocalGaloisGroups Layer 5. No generic character-polynomial scaling theorem was
reintroduced: current IntegralHeckeAndGaloisDeterminants Layer 3a.1 owns it.

Current upstream commit checked:
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti library checked:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Screened the nine newer roadmaps,
Completed roadmaps and current library by objects and hypotheses, and read
relevant matches. None supplies this eigenform character comparison.
ClassFieldTheory/LocalGaloisGroups supply the reciprocity inputs; generic unit
formation, Hilbert-space eigenvectors and analytic orthogonal bases are not
the modular refinement target. Read ArithmeticDirichletSeries and
ConformalMapping as complete current upstream models, including their
Suggested.lean files. The binding 12 October statement-only shape governs
this package even where older upstream files contain sorry'd data.

## Validation and next step

- Final `lean-check research/blueprint/packages/AutomorphicGaloisRepresentations/Suggested.lean`:
  exit 0; 20 warnings, all `declaration uses sorry`; no errors or other
  warnings. 354 lines, ten real-bodied definitions, nine theorem signatures
  and twenty examples. One compilation at a time; 91 GB available before the
  final invocation. No language server or build/update/cache command was run.
- Shared-build Mathlib commit was independently checked as
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The runner identifies its staged
  Tau Ceti snapshot as `f790474821cf4256814db967cb154e7af3d0c369`; that source
  tree has no git metadata. The imported interfaces were read; elaboration
  used this existing pinned build.
- Packet checker: 66 targets, 90 APIs, 66 tests; zero errors and warnings.
  The accepted twelve gaps and fifty-one supplier requests are unchanged
  implementation obligations. All targets, original API names and original
  test names remain covered, with 71 numbered README sections.
- Sorry-data, intake path/content and whitespace checks pass. Internal target
  links resolve, prerequisite links do not point forward or to themselves,
  and every named Lean definition/theorem occurs in the README.
- Metadata remains exactly `topic = "math.NT"`; `review.json` remains unchanged
  for the independent reviewer. No packet, reader document, atlas content or
  upstream checkout was edited.

The target-to-section map in
`PKG-AutomorphicGaloisRepresentations~2.md` remains valid in full. Independent
review should focus on the operator-to-character comparison, the coefficient
action/descent in the slope-zero argument, and the central specialization.
The package revision is complete; formal implementation of its stated targets
and imported supplier contracts remains future work. Scratch contains no
material needed to resume and is removed after opening the pull request.
