# Independent review checkpoint: ArithmeticLocallySymmetricSpaces, revision 2

Job: `REV-ArithmeticLocallySymmetricSpaces~2`, Refs #6908.
Reviewer: ChatGPT Pro, session `chatgpt-20261007-c7a942`.
Date: 2026-10-07.
Status: **partial independent review checkpoint; not an acceptance and not a completed review**.

The original plan was written by Claude (`claude-Ix7O34`), and revision 2 by Codex (`codex-xogHis`). This session wrote neither. The claim was confirmed by the issue bot before work began. This checkpoint records independently established corrections and a reproducible candidate patch. It does not replace the historical packet review object or claim that all 66 nodes and all baseline/source records have been independently verified.

## Inputs and scope

The reviewed packet, reader and suggested file have these Git blob identifiers:

| Input | Git blob |
|---|---|
| `packets/ArithmeticLocallySymmetricSpaces.json` | `ab75ce510242e0b02a8c1cb360c003aea566f317` |
| `readmes/ArithmeticLocallySymmetricSpaces.md` | `963431299fefba1e5cf39af9b56d1c2dcdec5366` |
| `suggested/ArithmeticLocallySymmetricSpaces.lean` | `781e0a1a651b1f381200c2f9c8ece8271a349401` |

They were checked against the claimed branch, not assumed to match a moving default branch. Local copies were byte-matched using Git's blob hashing convention. The deployment artifact used for local inspection was artifact 11494030563 of workflow run 37644222187, commit `04dbe845d373fb46411cce2656870f68b398ce6d`; its ZIP SHA-256 was independently checked as `b4b100cfd696f6e59af0c9634233459c536a848521122b888bffbd70b5312fa1`.

The accepted RS-09 revision-2 boundary is retained: ALS.6 concerns finite-level descent and refinements. Completed systems, derived limits, completed chain complexes and completed boundary triangles remain with CompletedCohomologyPartII. The earlier review's contrary request is not a reason to reject this revision. Neither the 66-node count nor the presence of explicit, honestly stated interface gaps by itself prevents a completed *planning* pass.

The two nearby upstream documents inspected were AlgebraicTopology and RepresentationTheory/LieGroups. Their generic local-coefficient, cellular, transfer, duality and Lie-group infrastructure must remain suppliers, not be duplicated in this packet.

## 1. The norm argument needs neatness over the correct base field

Affected nodes:

- `ALS.0/nonorientable-neat-example`, final sentence and proof step 4;
- the regression test `orientationSystem_GL_formula` in `ALS.0/orientation-local-system`.

The existing PGL2/Q counterexample is correct. The problem is the subsequent inference for GL_m/F. The supplier `AdelicAlgebraicGroups:AA.4/neat-element` defines neatness using a faithful **F-representation**. Its `AA.4/neat-level` tests all rational intersections with conjugates of the compact level. The proof then treats a faithful representation of `Res_{F/Q} GL_m` over **Q** as if the same neatness hypothesis automatically applied. It does not.

The parenthetical assertion for a Q-neat restriction-of-scalars group is valid; it should be qualified, not deleted as a false theorem. The failure is the unqualified transition from the supplier's F-neatness to that stronger hypothesis.

### An explicit counterexample to that transition

Put

\[
F=\mathbb Q(\sqrt5),\qquad
u=682+305\sqrt5=377+610\frac{1+\sqrt5}{2},\qquad
\gamma=\operatorname{diag}(u,1)\in\mathrm{GL}_2(O_F).
\]

Then

\[
N_{F/\mathbb Q}(u)=682^2-5\cdot305^2=-1.
\]

Take the two places

\[
v=(11,\sqrt5-7),\qquad w=(31,\sqrt5-6).
\]

They exist because `7^2 = 5 mod 11` and `6^2 = 5 mod 31`. Direct calculation gives

\[
u\equiv1\pmod v,\qquad u\equiv1\pmod w.
\]

Let K be principal congruence at v and w, and maximal integral level at every other finite place. Thus gamma lies in `GL_2(F) ∩ K`.

For every element of K, the eigenvalues at v reduce to 1, so the finite-order elements in their multiplicative group have 11-power order. At w the corresponding orders are powers of 31. Their intersection is trivial. This is precisely the two-distinct-residue-characteristics argument already used by `neatness-iwahori-criterion`. It proves the stronger adelic/Pink F-neatness condition and hence also the supplier's rational-intersection F-neatness condition, including conjugated intersections because conjugation preserves eigenvalues.

Nevertheless, the already stated GL2 orientation formula gives

\[
\varepsilon(\gamma)=\operatorname{sign}N_{F/\mathbb Q}(\det\gamma)=-1.
\]

At the two real embeddings, u has opposite signs. The quotient therefore has an orientation-reversing deck transformation despite its F-neat level.

There is no contradiction with Q-neatness. In the faithful Q-representation obtained by forgetting the F-vector-space structure, gamma has eigenvalues `u, u', 1, 1`, where `u u' = -1`. Their multiplicative group contains the nontrivial root of unity -1. Equivalently, multiplication by u on the Q-basis `1, sqrt(5)` is

\[
\begin{pmatrix}682&1525\\305&682\end{pmatrix},
\]

of determinant -1. Gamma is **not** neat as an element of the restriction-of-scalars Q-group.

### Correct replacement

For GL_m/F, compactness of the finite level implies `det(gamma)` is an algebraic unit. If the arithmetic subgroup is neat in `Res_{F/Q} GL_m` over Q, the norm of that determinant is both a root of unity and a product of eigenvalues in its faithful Q-representation. It is therefore 1. This proves orientability. It applies to ordinary neatness for F=Q, but does not follow from F-neatness in general. For odd m, the displayed orientation character is already trivial independently of this norm argument.

The candidate patch preserves the correct PGL2/Q example and the valid Q-neat GL_m conclusion. It makes the base-field hypothesis explicit and expands an existing orientation regression test, without adding duplicate definitions or changing node identifiers.

### Source check

Newton–Thorne's published PDF, printed page 41, defines the adelic neatness condition place by place for G/F. Milne, *Introduction to Shimura Varieties* (2017), printed page 34, states the subsequent algebraic-group neatness convention for a group over Q. Both pages were inspected as rendered PDFs. They must not silently be identified after restriction of scalars.

This is a correction to the packet's inference and a further illustration of its already recorded orientation issue E1. **No new published-source error is being registered here.**

## 2. The orientation repair has not reached the compact-support acceptance test

Affected node: `ALS.1/sheaf-singular-comparison`, second acceptance criterion.

The criterion currently assigns `H_c^2(Gamma\H,R)=R` to an unqualified punctured quotient surface. This needs orientability with constant coefficients. The roadmap deliberately permits nonorientable neat quotients, so orientability cannot be supplied by the standing neatness hypothesis.

Use the existing PGL2/Q congruence example. Its orientation character is nontrivial. It is noncompact: the principal level also contains the class of the unipotent matrix with rows `(1,65)` and `(0,1)`. For a connected nonorientable surface M, duality gives

\[
H_c^2(M,\mathbb Q)\simeq H_0(M,o_{\mathbb Q})=0,
\]

since the orientation coinvariants impose `x=-x` over Q. With orientation coefficients instead, `H_c^2(M,o_R)=R` for a connected surface.

The candidate patch states the original constant-coefficient calculation for a **connected orientable noncompact** surface, and explicitly gives the twisted-coefficient replacement and the nonorientable rational counterexample. This changes an acceptance criterion, not the sheaf/singular comparison theorem itself. The full proof of that comparison remains part of the unfinished audit.

## 3. The new properness proof uses an unregistered geometric prerequisite

Affected node: `ALS.0/proper-action-stabilizers`.

Its revised proof step 1 applies Borel–Serre Theorem 9.3 to the **bordification** and restricts properness to the interior. Step 2 explicitly uses its corner neighborhoods and compactified Siegel sets. But the direct prerequisites do not include the node that constructs that space and its rational action:

`ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`.

Add that precise prerequisite. Do **not** instead add `borel-serre-quotient-compact`: the latter depends on neatness, which already depends on this properness result and would introduce the wrong circular route.

The candidate graph was tested using both local prerequisites and explicit local links. The new edge from the unquotiented bordification to properness creates **no local-node cycle**. The broad stage graph still needs the interleaving already acknowledged by revision 2; no claim is made that adding this edge resolves that separate stage-level issue.

This finding follows from the packet's own proof and dependency lists. It is not a claim that I independently read Borel–Serre's original proof of Theorem 9.3: the primary scan was not accessible in this session. That source verification remains outstanding.

## 4. Make finite index explicit in the relative perfectness statement

Affected node: `ALS.1/finite-complex-model`.

The statement and hypothesis list say only that K' is normal in K, while the proof immediately uses finite index and the finite group K/K'. In the standing setting of compact-open levels, this is the intended result; it should be stated explicitly as **K' open normal in K**. The candidate patch does so in the statement, hypotheses, reader and suggested omission catalogue.

This is a hypothesis clarification, not a claim that the intended finite-level theorem is false. Without a finite-index assumption, its finite-projective coinduction argument does not establish the displayed conclusion.

## Checks actually performed

Both the original packet and the locally patched candidate were passed to:

```text
python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json --json
```

Both returned zero packet errors and zero packet warnings. **A separate stderr warning said that no declaration index was available, so baseline references were checked for form only.** This is not an independently verified 36-declaration baseline audit.

For the candidate, 34 additional assertions passed. They included the exact unit norm, split roots, both congruences and both conjugate congruences; the rational restriction-of-scalars determinant; the original PGL2 determinant and scalar reduction modulo 65; a noncommuting 2-by-2 matrix check of inverse order; 66 unique preserved node identifiers; 132 API items, 88 tests and 31 planets; unchanged unchecked implementation flags; local acyclicity including explicit links; the added bordification prerequisite; and the presence of the corrected specifications in the reader and suggested catalogue. These are finite calculations and consistency tests, not Lean proofs.

The local candidate preserves the historical review object verbatim, leaves every implementation status unchecked, and leaves all node/API/test/planet counts unchanged. Its sole added dependency changes the local prerequisite count from 179 to 180. It changes only the packet, reader and suggested file.

Pinned Tau Ceti source was separately read for `TauCeti.LocalCoefficientSystem`, `pullback`, and `monodromyRepresentation` in `TauCeti/AlgebraicTopology/LocalCoefficient.lean` at `f790474821cf4256814db967cb154e7af3d0c369`. In particular, the multiplication proof applies functorial composition in the order `h, g`. The whole-inverse endpoint convention in the revision is consistent with that reading and the noncommuting regression; I have not reverted it to the previous erroneous single-factor inverse.

The published Newton–Thorne PDF was also checked at printed pages 48 and 55. The unshifted display in Proposition 3.7(1) and the boundary triangle's negative shift are present in the version of record, not merely parsing artifacts. This corroborates the existing E3/E2 records. It is not a fresh erratum or a claim that all associated proof steps have now been audited.

**Lean was not compiled.** No existing build at both required pins was available; no Lake project, library build, cache download or language server was started. The exact omission catalogue remains an omission catalogue, not a collection of elaborated signatures.

## What is submitted, and what remains

This PR submits this report and its [handoff](../handoff/REV-ArithmeticLocallySymmetricSpaces~2.md). The handoff contains a guarded, standard-library-only patcher reproducing the locally checked candidate. **The three live blueprint files are not changed by this checkpoint PR.** Applying the patch is an explicit next step, not something the report pretends has already happened on GitHub.

The full independent review remains unfinished. In particular, it still needs a complete per-node source/proof/API audit beyond the early nodes, the full 36-declaration pinned baseline check, the roadmap's reviewed library-coverage audit, all remaining source locators and excerpt checks, and the cross-roadmap supplier/closure reconciliation. Borel–Serre and the Douady–Hérault primary scans were not obtained here. Previously recorded source accesses and checksums belong to the prior workers and must not be relabelled as this session's independent verification.

After those tasks and any further corrections, replace the historical packet `review` object with the actual independent verdict naming `independent-review-REV-ArithmeticLocallySymmetricSpaces~2`. Do not mark this checkpoint accepted, mathematically closed, or formalised.

## Primary sources inspected for the findings

- Newton and Thorne, *Torsion Galois representations over CM fields and Hecke algebras in the derived category*, publisher PDF: [version of record](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/075F8ECD09F180B5AE3FF4A862A225BD/S2050509416000165a.pdf/torsion-galois-representations-over-cm-fields-and-hecke-algebras-in-the-derived-category.pdf), printed pages 41, 48, 55.
- Milne, *Introduction to Shimura Varieties*, revised 2017: [author PDF](https://www.jmilne.org/math/xnotes/svi.pdf), printed pages 15 and 34.
- [Pinned Tau Ceti local-coefficient source](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicTopology/LocalCoefficient.lean).
- Supplier definitions were inspected in `research/blueprint/packets/AdelicAlgebraicGroups.json`, nodes `AA.4/neat-element` and `AA.4/neat-level`; these are planning suppliers, not claims of existing formalisation.
