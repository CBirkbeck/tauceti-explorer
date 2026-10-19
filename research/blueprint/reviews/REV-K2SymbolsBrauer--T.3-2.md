# Independent review of the T.3 residue integration

**Accepted as a completed planning pass, after corrections.** Codex, session
`codex-VvNkxi`, job `REV-K2SymbolsBrauer--T.3-2` (#10785), 2026-10-19.
The input was written by session `codex-diLt7e`; this reviewer did none of that
work. T.3 remains **planned**, with four explicit gaps and two requests. This
review makes no formalization or closure claim.

## Findings corrected

The packet and reader specified a useful native unit-factor API, but the
suggested file gave only its defining field-value equation. It omitted
`unitPart_mul`, `unitPart_unit`, `unitPart_change_uniformizer` and
`unitPart_residue_bridge`. The reader additionally named `unitPart_zpow` and
`unitPart_uniformizer_zpow`, which were bundled into other packet API entries
and absent from Lean. All six signatures now appear; the two power laws have
their own packet entries, and all eight API names use `TauCeti.T3Native`.
The residue bridge is definitional and is proved by reflexivity.

The original suggested examples covered normalization and native units but did
not state the packet's concrete tests under their proposed names. It now has
`unit_part_at_5`, `unit_part_change` and `unit_part_existing_unit`, including
U₅(10)=2, U₅(1/25)=1, U₁₀(5)=1/2 and its residue 3. The constructor's true
order-one hypotheses for 5 and 10 remain explicit proof inputs. The residue
example is stated through any ring map of the native residue field to
`ZMod 5`; it introduces no substitute residue-field object. The two existing
rational-valuation declarations used by these signatures were read at the
Mathlib pin and added to the baseline inventory.

The suggested header now states the required relation between the definitive
reader and the nonexhaustive signature aid. The two carried source findings,
E9 and E11, now also have independent, reasoned `confirmed` reviews.

The inherited field-comparison gap was also sharpened. Besides stable
presentation and root-coordinate inputs, T.1/k2-pi2 explicitly retains
`G-cover-Hurewicz`: its chosen BE(F)-plus cover and natural Hurewicz maps must
be compatible with the plus/Q comparison. The packet and reader now name this
input and its existing suppliers. It is not discharged by a generic plus
construction or by choosing an abstract group isomorphism.

## Mathematical checks

| Node | Independent assessment |
| --- | --- |
| `native-unit-part` | The pinned decomposition supplies an actual unit of the valuation subring. Surjectivity supplies the required nontrivial value group before the uniformizer equivalence is used. Cancellation proves uniqueness, multiplication, powers and parameter change on native carriers. |
| `native-tame-formula` | In fᵇg⁻ᵃ the uniformizer powers cancel for all integers a,b. Reduction therefore applies to a ring unit. The signed formula agrees with the stage convention and is the inverse of Weibel's formula. |
| `residue-convention-dictionary` | With Π on the right, moving it across a degree-(n−1) coefficient gives the factor (−1)ⁿ⁻¹. Expanding the Serre multiplication gives both stated product rules. Substitution Π↦Π−{c̄} fixes the residue and changes specialization by the stated term. |
| `degree-two-residue-square` | The positive index and right-action boundary give B₂([π]·[u])=ū. Thus the actual boundary requires inversion to agree with the roadmap's τ(u,π)=ū. The square names the actual symbol, determinant, plus/Quillen and connecting maps. |

I independently read the relevant arguments in the public author chapter
copies of Weibel's *The K-book*. Chapter/PDF page numbers below refer to those
separate chapters, not the published book's pagination:

- [Chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf),
  Lemma 6.3 and Remark 6.3.1, p. 51: the unit-factor formula, Steinberg cases
  and ramification identity. The packet's extension from finite extensions to
  any compatible valued-field embedding follows from its displayed order
  calculation and requires positive ramification index.
- Chapter III, Definition 7.1 and Theorem 7.3 with its proof, pp. 61–63, and
  Exercises 7.1–7.2 and 7.7–7.10, pp. 72–73: Milnor symbols, Serre algebra,
  specialization, the principal-unit kernel, restriction and base change.
  The relation Π²={−1}Π is essential; replacing it by square zero fails the
  negative-order Steinberg check.
- Chapter III, Definition 7.5, Projection Formula 7.5.2, Corollary 7.5.3 and
  Theorem 7.6.1, pp. 64–66: the Bass–Tate/Kato normalization and degree/tower
  interfaces. Corollary 7.6.3, p. 65, is the complete normal prime-degree case,
  not a proof of the general complete-extension theorem.
- [Chapter V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf),
  Exercises 5.1 and 5.3 and Example 6.1.2, p. 38: positive cokernel-minus-kernel
  boundary and right product action. Section 6.6–6.6.1, p. 41, identifies the
  DVR boundary; diagrams (6.6.3)–(6.6.4), p. 42, give the transfer square.

The inspected chapter hashes agree with the packet's `sourceVersions`. E9 is
confirmed directly: λ₅{5}=1 and λ₁₀{5}=3 contradict the specialization
independence requested in Exercise III.7.1. E11 is also confirmed directly:
Theorem III.7.3 gives residue 2 on {5,2} at 5, while Exercise III.7.10's printed
product rule gives 3 unless converted to its last-position convention.
These findings concern the identified author copies; no new claim about a
different published text or the unavailable current errata page is made.

The general Milnor norm proof cited from Gille–Szamuely is an inherited owner
boundary. I read that owner's statement and proof route, not a fresh copy of
the book. Its generic DVR support and finite-normalization completion product
remain explicit gaps. The accessible Weibel special case is not substituted
for that all-extension theorem.

## Coverage and ownership

All ten target groups in `targetCoverage` account for the umbrella stage's
classical symbol, localization, finite support, higher residues,
specialization/product signs, transfers, norm/residue and projection/degree
requirements. The four new nodes refine interfaces; 24 imports retain their
existing owners. Target-level granularity is appropriate here: the dictionary
and square assemble existing constructions rather than introducing another
Milnor presentation or localization sequence.

The imported finite-support proof uses the **union** of the nonzero-order
supports of all symbol entries. For a valuation family it needs the explicit
finite-support hypothesis on every field unit. A finite sum then still has
finite support; no unrestricted assertion about all valuation families is used.
The principal-unit and rigidity imports retain completeness and invertibility
of the modulus in the residue field.

I checked the actual supplier statements for the degree-one index, DVR boundary,
right product boundary, Matsumoto/plus comparison and field determinant. The
index and right boundary are already supplied as nodes. The two remaining
requests concern the exact torsion-quotient ring application and the ordered
unit-product/symbol equality. An abstract field-group isomorphism would not
meet the latter request.

The finite-extension norm square retains finite integral closure. Its
pushforward has residue norms, with no extra ramification factor; restriction
has the ramification factor. The reader's ramified, unramified and purely
inseparable checks distinguish these requirements. In particular, at t=s²,
ordₜ N(s)=1, while restriction multiplies the order by 2.

The current upstream roadmaps were checked at
`0d144d044dacebca17b654695b6f1ad58f159b27`, with current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. AlgebraicCurves Layers 2, 5, 9 and
12 already own the stated finite normalization, completion/residue,
coefficient and scheme/place comparisons. LocalFieldsRamification's extension
interfaces retain their local-field hypotheses. The missing generic
extension-lattice/norm/component-length contracts cannot be inferred from a
finite-residue theorem. The packet correctly avoids assigning already-owned
completion and coefficient constructions to the proposed Part II.

The four gaps remain exactly `G-T3-localization`, `G-T3-product`,
`G-T3-generic-DVR` and `G-T3-field-comparison`. They prevent closure but do not
leave an umbrella target unassigned. There are two new planets and five selected
umbrella landmarks, within the limit of six; native adapter plumbing is not
promoted to a separate landmark.

## Validation

- All 18 baseline declaration statements and their hypotheses were checked at
  Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. The elaboration build's relevant
  source files agree with those pinned revisions.
- `check_blueprint.py`: **0 errors, 0 warnings**. Four nodes, eight API entries,
  three named tests, 24 imports, four gaps and two requests.
- Dependency traversal finds **238 reachable nodes and no cycles** using current
  packet overlays. Preferring promoted records gives 164 reachable nodes and
  no cycles. The differing counts reflect supplier refinements; neither check
  found an unresolved terminal outside library or stage references. Stage
  terminals remain planning boundaries, not proved implementations.
- `lean-check`: successful elaboration, with only `declaration uses sorry`
  warnings. `check_sorry_data.py`: no admitted data bodies. The theorem and
  numerical-example proofs remain admitted.
- The source-issue and source-version validators report no errors. No source
  excerpt or private source file is included.
- Independent exact arithmetic on 510 rational inputs checks the unit-factor
  examples, signed tame values, parameter independence, negative-order
  Steinberg relation, diagonal/sign behavior and bilinearity. Ramification
  parity was checked for e=1,…,8 and orders −12,…,12. A concrete generator of
  𝔽₂₅ˣ has residue norm of order 4, checking the nontrivial unramified example.
  These regressions support the convention audit; they are not Lean proofs.

No further correction is required for this planning pass. Future closure work
must supply the four recorded inputs without replacing the specified maps by
assumptions or duplicating the current upstream constructions.
