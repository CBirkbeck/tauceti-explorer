# Independent review checkpoint: elliptic-curve modularity over imaginary quadratic fields

Job `REV-DESIGN-EllipticCurveModularityImaginaryQuadratic`, Refs #6905. Reviewer: ChatGPT Pro, session `chatgpt-20261007-c7a942`, 7 October 2026. The original design was written by Codex (`codex-Fj5emA`); this session did not write it. Claim comment 6042811314 was confirmed by bot comment 6042814714 before the review began.

**Status: partial independent-review checkpoint, not acceptance or a completed all-node review.** Four corrections are established below. The accompanying handoff specifies their application and preserves the exact arithmetic regression program. This checkpoint changes only the report and handoff, not the roadmap definition, packet, reader or suggested file. No implementation or mathematical closure is claimed.

## Input and review boundary

The packet was read on branch `chatgpt-20261007-c7a942-6905`, blob `c065d00784447d1bfe4df873ed7cb6ca17ffc5c0`; the reader has blob `d9a74a3d028165501a2910aa7149b9c98cd4cc7e`. Source findings below concern Caraiani–Newton, **arXiv:2301.10509v3, 27 March 2025**, not a purported version of record and not any later modularity theorem.

The detailed pass concentrated on the interfaces joining IQ.2 to IQ.3 and the genus-one/genus-two arguments in IQ.5–IQ.6. The remaining all-node source, baseline, library-coverage and supplier audit is unfinished. The designer's recorded Magma/source hashes, compilation and exhaustive-reader checks are provenance of that design, not independently repeated checks by this reviewer.

The mathematical targets remain source-scoped. Explicit gaps and withheld Lean signatures are not, by themselves, grounds for rejecting a complete planning pass. Conversely, a missing hypothesis or a false intermediate claim must not be treated merely as an implementation gap.

## F1. Supply a non-CM auxiliary curve; its CM branch does not prove modularity of the target

Affected nodes: `IQ.2/hilbert-local-selection`, `IQ.2/switch-five`, `IQ.2/switch-three`, `IQ.2/auxiliary-local-types`; consumer `IQ.3/cm-modularity`.

The switching outputs currently supply a *modular* auxiliary curve A. The next node requires its non-CM cuspidal representation, while its third proof step says to handle the final modularity goal directly when A is CM. The target curve is E, not A. A congruence A[p] ≅ E[p] does not identify their geometric endomorphism rings or by itself establish modularity of E. That branch does not discharge the consumer's need for a cuspidal automorphic lift.

There is a source-supported repair, without changing the prescribed reduction at p. Retain a Tate place away from the prescribed prime:

- For `switch-five`, retain Tate reduction at the places above 2 and 3 used by the independent 2–3 seed.
- For `switch-three`, choose Tate reduction at the places above 5 in the ordinary mod-5 construction, rather than the weaker alternative of good ordinary reduction.

CM elliptic curves have potentially good reduction everywhere; a Tate curve has nonintegral j at its Tate place. Thus these choices force A to be non-CM. Export this fact in the switching statements and use it in `auxiliary-local-types`. Remove the branch that transfers a CM assertion from A to the unrelated target E. Include the potentially-good-reduction fact for CM curves in the explicit supplier contract if it is not already supplied: do not assume that merely importing a Tate-curve carrier proves it.

**Evidence actually read:** Caraiani–Newton v3, Proposition 6.1.5 proof on p.89 retains the independent 2–3 seed and changes only the 5-adic conditions. Allen–Khare–Thorne, arXiv:1910.12986v2, printed pp.79–81, Proposition 9.12, proof of Proposition 9.13 and proof of Proposition 9.15, supplies the indicated Tate conditions. The public unversioned AKT URL served the 97-page v2 dated 2 September 2022; its title page and these pages were rendered and inspected. Corollary 9.14, not a theorem or lemma numbered 9.14, is the ordinary mod-5 endpoint in this version.

This is a correction to the blueprint's interface and proof, not a new accusation against either paper.

## F2. State the hypothesis needed for witness-preserving preparation

Affected node: `IQ.3/elliptic-lifting-data`.

The local Tate-module facts are stated for an arbitrary elliptic E over a CM field. Its subsequent extension construction invokes `solvable-preparation` with a decomposed-generic witness, but the comparison's initial hypotheses do not state residual decomposed genericity or supply that witness.

Keep the unconditional determinant, ramification and local Hodge–Tate statements. State the extension assertion conditionally: assume the selected residual representation is decomposed generic and fix a witnessing rational prime and the finite Galois avoidance field. Then use `solvable-preparation` to preserve that witness while obtaining the required local reduction types. Alternatively narrow the whole comparison to those additional hypotheses; its modularity consumer already has them.

This is a missing explicit input, not a claim that the unconditional local p-adic comparison is false. A witness-preserving theorem cannot construct a witness that was never supplied. Check the corresponding withheld signature and reader, not only the prerequisite label.

## F3. The genus-one argument needs the quotient Fricke relation, not an unproved lift

Affected node: `IQ.5/genus-one-modularity` (`genus_one_points_modular`).

Its statement and third proof step strengthen x(P)x(σP)=5 to σP=w5(P) **on the genus-one curve**. The cited source supplies the x-action on the quotient X(ns3,b5) and uses its Fricke quotient to deduce the geometric 5-isogeny. The source proof does not require the asserted equality on the double cover.

For the displayed quartic y²=h(x), where

h(x)=−3(x⁴+2x³−x²+10x+25),

one has x⁴h(5/x)=25h(x). Consequently both maps

w₊(x,y)=(5/x,5y/x²),   w₋(x,y)=(5/x,−5y/x²)

induce x↦5/x. A statement about x alone cannot distinguish them. The existing test point P=(1+2i,3+6i) satisfies σP=w₊P but σP≠w₋P. These identities were checked exactly. This example is a test of the insufficiency of the x-coordinate argument; it is **not** an identification of the actual modular Fricke lift with either sign.

**Repair:** state that the images of P and σP in X(ns3,b5) are related by its specified w5. Through the modular quotient dictionary, conclude that the underlying curves are geometrically 5-isogenous, hence that E is a Q-curve. Remove the stronger curve-level equality unless an additional explicit modular-lift comparison proves it. Preserve the real-quadratic FLHS branch and the rational-j branch.

**Evidence:** Caraiani–Newton v3, Proposition 7.2.1(2), printed p.94, and Corollary 7.2.5 with proof, p.97, inspected as rendered pages. This is an unsupported strengthening in the plan; no error in that source proof is asserted.

## F4. Rational infinity points are fixed by Galois and exchanged by w3

Affected node: `IQ.6/genus-two-modularity` (`genus_two_points_modular`). This also exposes a small, repairable error in the cited preprint proof.

The actual packet sextic is

f(x)=9x⁶−6x⁵−35x⁴+40x²+12x−8.

It is squarefree. In the infinity chart t=1/x, v=y/x³ the equation becomes

v²=9−6t−35t²+40t⁴+12t⁵−8t⁶.

Thus the two infinity points are (t,v)=(0,3),(0,−3), both rational and smooth; ∂(v²−t⁶f(1/t))/∂v=±6 there. The packet correctly states their rationality in `IQ.6/genus-two-sextic` and correctly identifies w3 with the hyperelliptic involution in `IQ.6/genus-two-model`.

It follows that every quadratic-field automorphism σ fixes each infinity point, while w3 exchanges them. In particular σP≠w3P at both infinity points. The later modularity node's equality in its infinity branch contradicts these earlier, correct specifications.

The correct argument separates three cases:

1. If P is rational, including either infinity point, its image under the Q-defined j-map is rational. For a noncuspidal point this gives modularity through the existing rational-j and twisting/base-change input.
2. If P is affine of **exact degree two**, x(P) is rational and P is not rational, then y(σP)=−y(P), so σP=w3P. This gives the geometric 3-isogeny and Q-curve branch.
3. Handle the nonrational-x imaginary exceptions by the existing exceptional-curve comparison. Keep the real-quadratic FLHS branch separate.

A point in C(F) is not necessarily of exact degree two over Q. This distinction is essential here. No change to the final modularity conclusion is needed for this correction.

### Proposed source-issue record E20

The same erroneous inclusion of the infinity points occurs in Caraiani–Newton v3, Corollary 7.3.4 proof, printed p.98. The page image was checked, so this is not a PDF text-extraction artifact. The relevant short excerpt is “(and the points at infinity) have σ(P) = w₃(P).” The finding belongs against this **preprint version only**.

Use ID `EllipticCurveModularityImaginaryQuadratic/E20`, source `CN`, kind `error`, affects `the proof`. The correction is the rational-point/exact-quadratic split above. The final conclusion survives this repair; nothing here requests withdrawing or weakening the theorem. Confirm with reviewer `REV-DESIGN-EllipticCurveModularityImaginaryQuadratic` when the record is actually added to the packet.

The current packet contains E4, E5, E9, E17, E18 and E19, but not this infinity-point finding. Its other source-issue records must be preserved. Searches of the arXiv history, Newton's public publications list and targeted erratum/corrigendum queries did not locate a correction in this pass; this is a bounded search, not proof that no correction exists. No version of record for this paper was independently established here, and no author was contacted.

## Actual validation

An independent SymPy program ran **40 exact arithmetic assertions**, all passing in the final run. They check the sextic degree, leading coefficient, squarefreeness and factorization; its three rational roots; both smooth rational infinity points and their nonfixed involution images; both exceptional points ((−5+s)/6, ±(17−s)/6), s²=−11; the genus-one reciprocal identity and Gaussian test point with both lifts; coprimality and projective degrees of the five j-functions; selected exact j-function values; and the discriminants of B, E15 and Es35. The complete program is preserved in the handoff. An initially mistyped scratch factorization was corrected using polynomial factorization before the final run; it was not a finding against the packet.

These are elementary arithmetic regressions, **not** a Magma replay, complete point classification, rank or saturation computation, packet checker, or Lean proof. No finite point search is used as a rank certificate.

**`scripts/check_blueprint.py` was not run for this job.** The input packet was inspected through the GitHub connector, not reconstructed and checked as a complete local packet. No declaration-index verification is claimed. The pinned Weierstrass source was read for its coefficients, discriminant, ellipticity and j definitions; this is not the full fifteen-declaration baseline audit.

**Lean was not compiled.** There is no matching existing build on this machine; no new Lake project, dependency build, cache download or language server was started. Existing omission comments are not executable signatures.

## Continuation

Apply the four scoped corrections to the actual packet and synchronize the reader and withheld contracts in the suggested file. Add E20 with explicit preprint-version provenance. Then finish the independent source/node/API audit, all baseline references, reviewed library coverage, the exact supplier contracts (including the now-existing crystalline-lifting sibling), route coverage and remaining source-issue reviews. The genus-three model, Jacobian, saturation and finite-sieve certificates in IQ.7 particularly need their own careful pass; this checkpoint does not verify them.

Do not replace the packet's review object with acceptance on the strength of these selected checks. When the full review is complete, record the actual verdict as `independent-review-REV-DESIGN-EllipticCurveModularityImaginaryQuadratic`.

## Sources opened for these findings

- Caraiani–Newton, [arXiv:2301.10509v3](https://arxiv.org/pdf/2301.10509v3), especially printed pp.89–90, 94 and 97–98.
- Allen–Khare–Thorne, [public arXiv PDF](https://arxiv.org/pdf/1910.12986), served as v2, 2 September 2022: title page and printed pp.79–81.
- [Newton's publications page](https://people.maths.ox.ac.uk/newton/publications.html), for the bounded version/correction check.
- [Pinned Weierstrass source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean).
