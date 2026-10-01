# Red team: Clozel–Thorne III

Codex, session `codex-rtOQ9t`, 1 October 2026. Refs #4200.
Target: `PAPER-CLOZEL-THORNE-17`, at atlas commit
`8e2d26b05c193cec0f3cd7f7a3f02510d6e2d3f5`.

Five findings need independent verification: three high and two medium. They concern the integral Hecke presentation, rational versus integral duality, an erroneous recorded source gap, an unapplied source correction, and shared ownership. The extraction and its review were written by Claude Code sessions `cc-442dc5` and `cc-38267a`, respectively; this worker did neither.

## Source and scope

I read the entire 53-page [accepted manuscript, dated 10 December 2015](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download), including its references, against all 81 items, eight routes, 26 prerequisites and 23 source issues. I also read both human reports and the independent review JSON. Page images 7, 13–16, 18 and 45 resolved the presentation, matrix, coefficient and hypothesis checks. The manuscript's SHA-256 is `fb88e83c3c056c2fa6100d1fbb4d0853c4ec636cc68a33548ac4259336094742`.

The [journal DOI](https://doi.org/10.1215/00127094-3714971) identifies Duke Mathematical Journal 166 (2017), 325–402. Crossref's publisher download returned an Incapsula denial page, with HTTP 200 but HTML content. I could not compare the journal printing. Crossref metadata has no correction relation; the author listing and title/erratum search revealed no correction. The source-error finding below is confined to the accessed manuscript.

The source pass covered the local building/Hecke constructions and packet modules (§2); transfer factors, Jacquet identities and multiplicity counts (§3); integral global pairings and the level-raising dimension contradiction (§4); local/global deformation data, dimension arguments and automorphy lifting (§5); and the symmetric-power and mixed-parity reductions (§§6–7). The earlier review's complete symbolic matrix check was not rerun. I inspected the displayed matrices and the already recorded bad entry, but do not claim a fresh machine verification of every relation.

## 1. The integral braid-group presentation is impossible — high

Item 006 and route 6 assert

\[
H_{B,\mathbf Z}\simeq\mathbf Z[B_W]/((T_s-q)(T_s+1)).
\]

Here `B_W` is a group, and the proposed map identifies its generator with `[BsB]`. Correcting the source's quadratic sign, as E6 does, leaves a second error: the group generator is invertible, but the integral double-coset element is not.

The trivial representation defines a unital degree character to the integers. It sends `[BsB]` to the number of right cosets, `q`. Since `q>1`, this cannot be the image of a unit. In rank one the obstruction is already visible in the free rank-two algebra `Z[T]/((T−q)(T+1))`: evaluation at `T=q` proves that `T` is not invertible.

The correct integral presentation uses positive braid generators with braid and quadratic relations. After inverting `q`, the quadratic equation gives

\[
T_s^{-1}=q^{-1}(T_s-(q-1)),
\]

and a braid-group presentation is appropriate. The paper's later coefficient ring `O`, with residue characteristic `l≠p`, has `q` invertible, so this repair preserves that application.

Correct the item and brief, and record a separate manuscript source issue for pp.6–7. Existing Tau Ceti double-coset multiplication and its degree homomorphism are imports, not new work.

## 2. Local duality and averaging are over the fraction field — high

Item 065 asserts a perfect pairing on `Y_O^B` from self-duality of `Y_K`. The proof of Proposition 2.9 on p.18 instead gives

\[
Y_K^B\times Y_K^B\longrightarrow K.
\]

The annihilator argument is in these localized `K`-spaces. It supplies neither an integral perfect pairing on the chosen lattice nor a self-dual lattice construction. Item 064 similarly needs an explicit coefficient restriction for `e_P=(1+T_s)/(q+1)`.

This matters because Proposition 2.9 assumes `q≡−1 (mod l)`. Let

\[
A=O[T]/((T-q)(T+1)).
\]

The rational projector sends `1` to `(1+T)/(q+1)`. In the free `O`-basis `1,T`, its coefficients are nonintegral when `q+1` is a nonunit. It therefore need not preserve an integral Hecke module. Remark 2.7 also separates the rational matrices from the earlier integral construction under the primitive-root hypothesis.

Restore the local duality to `K` and the projector to `C/K` or an invertible-volume coefficient regime. Preserve the integral Bernstein action/localizations separately. The global integral perfect pairing needed for level raising is independently proved in Proposition 4.3, p.36. It must not be confused with local rational self-duality.

## 3. E22 overlooks an existing hypothesis — high

E22 alleges a missing hypothesis in Theorem 6.2. It reduces its concern to the possibility that `[F(ζ_l):F]=2`, then says the theorem does not exclude it. But hypothesis (3) requires `q_{u_0}` to be a primitive root modulo `l`.

That residue cardinality is prime to `l`. Arithmetic Frobenius at `u_0` acts on `ζ_l` by exponentiation to `q_{u_0}`, an element of order `l−1`. Hence

\[
[F(\zeta_l):F]=l-1,
\qquad F\cap\mathbf Q(\zeta_l)=\mathbf Q.
\]

For `l=5,7` these degrees are 4 and 6. By the same Dickson reduction used in E22, the projective residual image is `PSL₂` or `PGL₂` over a finite field and its abelian quotients have order at most two. Its fixed-field extension cannot contain this cyclotomic extension. The projective image of the residual symmetric power is a quotient of the original projective image, so this also suffices for its adjoint fixed field; equality of projective kernels is unnecessary.

The auxiliary-field step also retains this argument. On p.45 the proof defines the finite Galois extension `L/F` containing both the residual and cyclotomic fields, then chooses `S` so that every simple Galois intermediate extension has a place of `S` that does not split. The auxiliary extensions are soluble and `S`-split. The Galois closure `M/F` of their compositum is again soluble and `S`-split. If `L∩M` were nontrivial, its nontrivial finite soluble Galois group would have a simple quotient, giving an intermediate extension of `L/F` that both splits at every place of `S` and is detected by `S`. This is impossible. Thus `L` and `M` are disjoint, preserving the joint residual/cyclotomic image through the extensions on pp.45–46.

E22 should be retired as a source gap, with its audit history preserved. Item 049 and route 4 should record this verification instead of requesting another hypothesis. The independent review's contrary conclusion needs an explicit correction through the verification workflow; this red team does not silently rewrite that review.

## 4. Apply E21 to the actual statement — medium

Item 040 still quantifies over arbitrary deformation conditions at `R_0`. Its note and confirmed E21 correctly observe that the auxiliary constituent problems in the proof of Lemma 5.3 impose unipotent conditions there. The source's general deformation datum includes nontrivial `R_v^{χ_v}` conditions, which do not automatically meet those auxiliary conditions.

Put the restriction into the statement itself: at `R_0` use the indicated unipotent types `R_v^1`, `R_v^St` or `R_v^m`. An extension to general character conditions requires its own argument. This is propagation of an already recorded correction, not a newly alleged error in the paper. The application in the proof of Theorem 5.1 has `R_0=∅` and is unaffected.

## 5. Reconcile the common Iwahori owner — medium

Route 6 invokes the Kisin–Pappas parahoric-centers candidate as owner of the common Iwahori presentation. The current Kisin–Pappas routes 10–11 instead make the Part II import that presentation from `SmoothRepresentationsOfLocalGroups:SR.1/SR.4`. This change follows independently confirmed `RT-PAPER-KISIN-PAPPAS-18/18`, applied in [PR #5262](https://github.com/CBirkbeck/tauceti-explorer/pull/5262).

The reason is visible in the accepted Venkatesh extraction: its item 29 and later Iwahori/Morita/derived consumers already sit in the base SR route. Sending their common presentation to a downstream Part II reverses the intended dependency. The narrower coefficient specialization in Venkatesh does not establish all coefficient regimes; the common SR supplier still has to prove those regimes explicitly.

Reconcile items 006/008 and routes 2/6 with that supplier. Keep the additional Kazhdan–Lusztig classification and standard modules in the Part II. He21's generic affine-Hecke cocenter branch remains distinct and requires a specialization bridge to concrete convolution algebras. Neither construction should redefine Tau Ceti's abstract double-coset ring. This finding concerns the extraction's inconsistent routing, not a request to edit upstream roadmaps.

## Ownership, library and completeness checks

I read the 24 cited assembled stage descriptions and all seven available matching reviewed coverage entries: `G7`, `R01.1`, `R01.2`, `R01.4`, `AG2.0`, `AG2.2`, `AG2.5`. The checked coverage file has no matching entry for the other cited stages. Relevant RS-21/RS-08 ownership records and the Kisin–Pappas, Venkatesh, He21 and Newton–Thorne coalescence interfaces were compared. The general polarized lifting inputs remain distinct from the paper-specific level-raising argument; local rings remain at L7; residual symmetric-power operations remain at G7.

At the pinned commits I read Mathlib's `CoxeterSystem` and length definitions and Tau Ceti's `TitsSystem`, double-coset basis/degree API and `LeftCosetModule.deg`. Focused searches also found Coxeter braid equivalence and a Burau-matrix quadratic identity; their statements do not establish the general Iwahori presentation. Those partial ingredients must continue to be reused. This audit does not promote the extraction's composite missing items to library status merely because a carrier or special identity exists.

All 64 missing items have exactly one route. All cited planned/source stage ids resolve. I found no additional omission sufficiently established to report after the source/item comparison. That does not certify all proof interiors: §16 extracts directly used definitions and key results, while supplier proof closure belongs to their blueprints. In particular, I have not independently reopened every external theorem or certified every remaining source-issue proof repair.

Validation:

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CLOZEL-THORNE-17.result.json`
- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-CLOZEL-THORNE-17.result.json`
- `python3 research/blueprint/intake.py check-files` on the two deliverables
- `git diff --cached --check`

No Lean file is required for this red team, and no Lean compilation was run.
