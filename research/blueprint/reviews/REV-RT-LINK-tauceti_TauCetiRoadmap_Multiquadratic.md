# Verification of the Multiquadratic link-map red team

**Complete: both findings confirmed (medium); none rejected.** Codex — `codex-hjdg0j`, 24 September 2026. Refs #1744.

Independence: the link map was authored by ChatGPT Pro `cgp-9dbda3a312c1` (PR #790), reviewed by Codex `codex-c83e7a` (PR #1044), and red-teamed by Codex `codex-a71f92`. I did none of those jobs. Claim 5805372213 was confirmed by bot comment 5805373882 before work began.

The two findings identify existing code mistakenly left as implementation obligations. They warrant correcting the accepted map's import boundary while retaining its three links and the ordinary/narrow distinction. This submission verifies the findings; it does not apply the separate fix job or reopen the entire dependency-map review.

## Evidence read

Explorer input: [`5664250867ee9ab75069d977ddf59efb7d64e6a9`](https://github.com/CBirkbeck/tauceti-explorer/tree/5664250867ee9ab75069d977ddf59efb7d64e6a9). Read the full red-team result and report, the accepted map's links/overlaps/requests/baseline metadata, its independent review report, the four Multiquadratic layers and the named QuadraticFormInvariants square-class contract. The governing rules are unchanged from the preceding job and were retained.

Read the complete `NarrowGenusField.lean`, `Multiplicative.lean` and `GenusField.lean`, including their proofs and ambient variables, plus the additive square-class carrier, module instance and quotient API in `SquareClassGroup/Basic.lean`. All four files were independently fetched at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and byte-compared to the source copies read. Both finding hashes match:

| New evidence file | Bytes | SHA-256 |
| --- | ---: | --- |
| `TauCeti/NumberTheory/Multiquadratic/Unramified/NarrowGenusField.lean` | 7959 | `bb1d50d8820f79047d0628023aacd18d79909cd2a61ad6fa7b84b15fe10c084f` |
| `TauCeti/FieldTheory/SquareClassGroup/Multiplicative.lean` | 9426 | `9d5d29847994ee730341e7e89b4c11ebab243b614baf1a49bd18a9284c838aba` |

Mathlib baseline remains `082e2d37e8b0463410cdb532e111cd43d5a66174`; these two findings are established by Tau Ceti declarations, so no new independent Mathlib coverage claim is made.

## Finding 1 — confirmed

[`IsNarrowGenusField`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Multiquadratic/Unramified/NarrowGenusField.lean#L68) packages exactly the finite-place notion: a chosen root of the integer radicand, a quadratic generated subfield, abelian Galoisness over Q, finite-prime unramifiedness and maximality via embeddings. Its comparison fields lie in the same universe. The maximality field itself supplies an embedding without a root-preservation equation; the subsequent theorem at line 100 proves that two such objects admit an equivalence carrying their chosen roots to one another. The weaker nonempty-equivalence theorem is at line 130.

The theorem at line 140 constructs the predicate for the existing candidate field from `Squarefree d` and `¬ IsSquare (d : Q)`. It imposes no sign restriction and fills every structure field with a proof. This directly contradicts the remaining predicate-packaging obligation in `MQ-LINK-R1`.

The future-work comment in [`GenusField.lean`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Multiquadratic/GenusField.lean#L55) is present but stale as an account of the whole pin. The ordinary predicate includes infinite-place unramifiedness; its negative-radicand construction at line 114 uses `candidateGenusField`, and its positive nonsquare construction at line 149 uses `candidateGenusFieldReal`. Retaining this distinction is necessary: for discriminant 12 = (−4)(−3), the full compositum contains i, so cannot be everywhere unramified over the real field Q(sqrt(3)). Here the squarefree radicand is 3, not 12.

**Fix boundary:** update the second overlap, R1 and baseline qualification to import the existing narrow predicate, candidate theorem and uniqueness API; add the source evidence. R1 remains open for the ordinary/narrow source correction. Do not infer the narrow-class-group/Galois comparison, all ray-class adapters, or cross-universe narrow uniqueness from these statements. Keep historical review text and all dependency edges; record the correction in the authorized fix report.

## Finding 2 — confirmed

The first link's reason assigns multiplicative notation, field-map and cardinality adapters to future consumer work. The [three actual consumer bullets](https://github.com/CBirkbeck/tauceti-explorer/blob/5664250867ee9ab75069d977ddf59efb7d64e6a9/content/tau-ceti/QuadraticFormInvariants/README.md#L615) match the implemented [multiplicative square-class file](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/SquareClassGroup/Multiplicative.lean#L45):

- Lines 45–94: literal unit-square quotient, its multiplicative comparison with the additive square-class carrier, the `ZMod 2`-linear elementary-two comparison, and generator formulas.
- Lines 99–107: equivalence of finiteness and equality of `Nat.card` for the two presentations. This transfers finiteness rather than proving every square-class group finite.
- Lines 118–198: multiplicative and additive pushforward along field homomorphisms, their generator/identity/composition laws, and compatibility of the comparison with pushforward.

The ambient hypotheses are fields, including fields of characteristic two. Restrictions for later quadratic-form theory do not narrow these generic interfaces. The [additive base file](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/SquareClassGroup/Basic.lean#L45) defines the matching quotient and its `ZMod 2` module, so these are adapters to the actual supplied carrier, not a similarly named alternative.

**Fix boundary:** retain the explicit source/target edge and its historical ownership evidence, update its reason to classify all these generic adapters as imports, and add `Multiplicative.lean` to baseline evidence. Leave form-specific representations, comparisons and invariants with the consumer. If its README is outside fix scope, add a source-correction request distinguishing the historical milestone from currently missing work. No blanket claim that Layer 0 is complete follows.

## Checks and limits

All four inspected library files contain no `sorry` or axiom declaration. Public constructions and theorem proofs were read; private helper lemmas in `Multiplicative.lean` were not misrepresented as public API. This is not a new kernel check or a transitive dependency audit.

Validation: `python3 scripts/check_redteam.py research/blueprint/redteam/RT-LINK-tauceti_TauCetiRoadmap_Multiquadratic.result.json research/blueprint/redteam/RT-LINK-tauceti_TauCetiRoadmap_Multiquadratic.review.json`; `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-LINK-tauceti_TauCetiRoadmap_Multiquadratic.review.json research/blueprint/reviews/REV-RT-LINK-tauceti_TauCetiRoadmap_Multiquadratic.md`. Both findings have exactly one verdict. Only the two authorized review deliverables change. No Lean file was produced or compiled. The red team's wider catalogue screening, unrelated edges and theorem inventory have not been independently re-certified here. No submitted finding remains unverified.
