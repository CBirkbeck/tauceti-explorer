# Independent review: the classical residue map

**Verdict: accepted after corrections.** This is a completed target-level planning pass for `K2SymbolsBrauer:T.3:symbols`, with coverage still **planned**. The elementary pairing, parameter independence, Steinberg proof, Milnor descent and uniqueness argument are sound. Classical K₂ transport retains the inherited comparison boundary identified below; this verdict does not claim that the boundary is closed or that the planned theory is formalised.

Reviewer: Codex, session `codex-xxAcrX`, 2026-10-19, job `REV-K2SymbolsBrauer--T.3-symbols` (#10787). The input was written by the separate Codex session `codex-Cqls1Y`, job `BP-K2SymbolsBrauer--T.3-symbols`, submitted in #10944. This reviewer did none of that work. The packet records this review as `independent-review-REV-K2SymbolsBrauer--T.3-symbols`.

## Corrections made

1. **Consume the existing local-field unit component.** Current Tau Ceti already implements the uniformizer splitting in `TauCeti.unitsEquivIntProd`, owned by LocalFieldsRamification Layer 1. The original audit did not account for it. The generic algebraic unit-part function is still needed for arbitrary discretely valued fields, including incomplete ℚ at 5. Added `unitPart_localField`, its explicit equality-of-orders hypothesis, a supplier-stage prerequisite and request, the actual second-coordinate source locator, and a compatibility check on a pole times a unit. The comparison is in the underlying field unit group; it does not assume equality of the two subgroup carriers. The specialized splitting is consumed, never reconstructed. Its implementation is newer than the pins, so the comparison remains a reader target.
2. **Apply the current suggested-file rule.** Replaced individual Mathlib imports with `import Mathlib`, keeping the two Tau Ceti imports used. Converted the admitted examples to named theorem targets listed in the reader. Added exactly two proved examples for each of the two kept real-bodied definitions: identity and a negative power for unit parts; identity and the signed uniformizer diagonal for the pairing. These checks reduce the actual defining expressions rather than invoking an admitted normalization theorem. The membership theorem used in the pairing's subtype remains a proof target, not missing data.
3. **State the baseline domain accurately.** `Valuation.isUniformizer_iff_ord_eq_one_of_surjective` quantifies over a field element and uses the nontrivial value-group instance; it is not restricted in its signature to an element already bundled in the subring. Corrected the packet's description.

The reader, packet and suggested file agree on the corrections. The four canonical target identifiers remain with the original T.3 packet. No new K-theory carrier, source passage or extra planet was introduced.

## Source and sign audit

I read Weibel's author-hosted [separate Chapter III PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), independently checking its SHA-256 against the packet. The relevant passages are Theorem III.6.1 and the following sign calculation, printed p.48; Definition III.6.2, p.49; Lemma III.6.3 and its complete proof, p.51; and Definition III.7.1, pp.61–62. The packet's exact public version and pagination are retained. No source text is reproduced in the deliverables.

For orders a=ord(f), b=ord(g), the roadmap uses the residue of f^b/g^a, with sign (−1)^(ab). Weibel III.6.3 uses the opposite quotient. Thus the roadmap has ∂{u,t}=res(u), ∂{t,u}=res(u)⁻¹, and its map is the inverse of Weibel's. The diagonal is (−1)^ord(f), not identically one. The choice is consistent across the pairing, descent, classical transport and uniqueness statement.

The four Steinberg cases were checked individually. Positive order of either complementary entry reduces the other to one; two zero orders give one immediately. If a<0, the other order is also a, the residue of r/(1−r) is −1, and the total exponent a²+a is even. This also proves the result for negative orders and in residue characteristic two. The exhaustiveness argument uses subring closure when a≥0. No completeness or finite-residue-field hypothesis is hidden in the proof.

The uniqueness result is correctly described as derived from the field sign calculus and the uniformizer decomposition, rather than as a separate numbered theorem of Weibel. Bilinearity and Steinberg give skew-symmetry and the diagonal identity. Mixed normalization then determines c(t,t)=−1 and c(t,w)=res(w)⁻¹; integer bilinear expansion determines c on every pair. Unit-unit symbols are killed by the map, not declared zero in K₂.

## Baseline, upstream work and closure

I read the actual statements and surrounding hypotheses of all twenty baseline entries at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. In particular:

- Product order needs both inputs nonzero; integer powers keep integer exponents. Symbol inputs are units throughout. The subring nonnegative-order criterion includes zero, whose junk order is handled separately; maximal-ideal positive order requires a nonzero subring element.
- Surjectivity supplies the exact nontrivial value-group instance needed by uniformizer existence and decomposition.
- `Valuation.mem_unitGroup_iff` has an explicit field parameter. `unitGroupMulEquiv` and `unitGroupToResidueFieldUnits` provide the actual carriers, coercions and residue homomorphism, including its surjectivity.
- `TauCeti.Place.residueUnit` uses that residue homomorphism. Its integers and residue field require the equality transports stated in the reader; definitional identity is not assumed.
- `Rat.padicValuation` and its surjectivity require primality. `IsLocalRing.ResidueField.map` requires a local ring homomorphism. The e=0 embedding from ℚ with its 5-adic valuation to ℚ(X) with its X-adic valuation preserves valuation rings but is not local: 5 becomes a unit. Positive e supplies the required locality for a residue-field map.

The reviewed AUDIT-29 entry in `data/library-coverage.json` was read. I also searched the current read-only roadmap, Completed and Tau Ceti trees, and read the relevant LocalFieldsRamification interfaces. The checked commits are recorded in `upstreamAudit`. No tame-symbol or integral Milnor-K implementation was found. The current local-field splitting and place residue are explicitly consumed. GrothendieckEulerForms and GlobalNumberFields were read as the two upstream models for API and document detail. No upstream file was edited. A fresh open Mathlib PR search for “tame symbol” and “Milnor” found no relevant implementation. A public Zulip archive search found the [Ideals over algebras discussion](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Ideals.20over.20algebras.html), which records interest in the tensor-algebra quotient for Milnor K-theory, not a supplied tame-symbol or Milnor-K implementation. These search results are not evidence of implementation status beyond their stated scope.

For inherited closure I read the canonical four T.3 nodes, the Milnor and Matsumoto contracts, and the accepted T.2-symbols tensor-realization, homogeneous-components and field-calculus nodes. Milnor descent uses the tensor quotient universal property followed by the explicit degree-two homogeneous comparison. It does not assume without proof that a ring quotient has the desired homogeneous component. Surjectivity lifts a residue unit u and uses {u,t} as its preimage.

Only the classical map and its classical uniqueness corollary need the inherited infinite-field Matsumoto comparison. Its stable-colimit witness (ultimately T.1's G-colimit) and exact ordinary root-presentation/Bruhat-coordinate API remain open at their existing owners. Those dependencies are retained in the packet's gap and coverage ledger. An order-one parameter already forces F infinite, since its integer powers have distinct orders; the finite-field Matsumoto gap is irrelevant here. Bass–Tate, localization comparison, higher residues, transfer, reciprocity and tame kernels remain outside this supplement.

The added local-field request is an implemented supplier contract for the specialized compatibility API, not a new mathematical gap or a prerequisite for constructing the general pairing. The generic construction does not assume a local-field topology.

## Node, API and test verdicts

| Node | Verdict | Reason |
| --- | --- | --- |
| `T.3:symbols/unit-part` | Corrected | Actual unit-subgroup carrier and parameter-change law verified; current local-field compatibility and its supplier contract added. Twelve API entries and six checks now cover its uses. |
| `T.3:symbols/residue-uniqueness` | Verified | Field-only sign calculus and integer bilinear expansion prove the characterization; both normalizations and Steinberg are necessary. |
| `T.3/tame-symbol` | Verified | Signed formula, zero-free residue domain, mixed normalizations and compatibility interfaces agree. |
| `T.3/tame-symbol-uniformizer-independence` | Verified | The order-zero product removes t; the two parameter-change exponents also cancel. |
| `T.3/tame-symbol-steinberg` | Verified | Both bilinear laws and all four cases hold with the chosen inverse convention. |
| `T.3/tame-symbol-hom` | Verified with inherited boundary | Exact imported contracts supply Milnor descent and surjectivity; classical transport remains conditional on the recorded comparison inputs. |

All node IDs in the table have prefix `K2SymbolsBrauer:`. Per-node verdicts also appear in the packet's `review.checked` list. Two new nodes supplement four canonical targets at the correct target granularity; routine sign and order calculations remain proof steps.

The tests distinguish a constant-one unit part, a residue-only carrier, absolute-valued orders, a reversed parameter-change exponent, the zero pairing, the inverse convention and the unsigned non-Steinberg formula. The new local-field pole check also compares with the nearest implemented specialized construction. The two planets retain the canonical owners and the names **Tame symbol** and **The tame symbol is a Steinberg symbol**; bookkeeping and uniqueness add no planets.

As an independent arithmetic check, exact rational calculations at primes 2, 3, 5, 7 and 11 tested 86 distinct nonzero rational inputs: 425 complementary pairs, 36,980 swap identities, 5,000 instances of each bilinear law and 23,908 unit-parameter changes. All passed. These finite checks supplement the source proof; they do not replace it. All six entries of the reader's 5-adic table, its unit-part values and the characteristic-two diagonal were recomputed. In particular (1/5,4/5) has signed value 1 and unsigned value 4 at 5, and changing the parameter from 5 to 10 preserves the value 3 on (10,5).

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.3-symbols.json`: zero errors and zero warnings, using the installed declaration index.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/K2SymbolsBrauer--T.3-symbols.lean`: passed.
- `lean-check research/blueprint/suggested/K2SymbolsBrauer--T.3-symbols.lean`: elaborated at the pins; the only warnings are named theorem proof placeholders. Four examples are proved; none is admitted. The file has 285 lines.
- Intake `check-files` over the four issue deliverables and the handoff: five files, zero problems. `git diff --check`: passed.

The accepted result is the corrected planning pass with the stated inherited boundary. Every local node remains `implementationStatus: unchecked`.
