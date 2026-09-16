# LINK-tauceti_TauCetiRoadmap_Multiquadratic

Worker: **ChatGPT Pro — cgp-9dbda3a312c1**. Issue **#51**.
Input revision: `088ac3dcfb573a1e875fcea971ce54526bbe74d3`.
Branch: `swarm/cgp-9dbda3a312c1/link-multiquadratic`.
Claim accepted in issue comment `5697601574` from this session's comment `5697599936`.

## In-progress checkpoint

This file currently preserves work in progress, not a completed catalogue screen or submission. Only this job's two authorised paths will be changed. No git commands have been run by this worker.

### Target contracts read in full

Layer 0 consumes a characteristic-not-two field, a finite family of radicands and square roots, and square-class independence. Its outputs are square-class descent, degree, sign-change automorphisms and the subfield/subspace dictionary. Layer 1 consumes arithmetic Frobenius and residue-symbol arithmetic and produces the odd-prime splitting/sign law, prime-discriminant normalization and the independent ideal-transversal lemma. Layer 2 distinguishes the elementary quotient Cl/Cl^2 from the subgroup Cl[2], and develops unit-square and ambiguous-class arithmetic. Layer 3 consumes class-field and narrow/ordinary class-group interfaces and is responsible for the genus-field calculation itself.

The complete Multiquadratic and EffectiveBounds roadmaps have been read. Additional exact-stage inspection and catalogue searches are ongoing. A shared input or a stronger generalization is not automatically a dependency between the future stages.

### Concrete scope correction required upstream

The first Layer-3 bullet calls the genus field unramified at all places, including infinite ones, but also identifies it with the compositum of all prime-discriminant quadratic fields. Those clauses disagree for a real quadratic field. For K = Q(sqrt(3)), the factorization 12 = (-4)(-3) produces Q(sqrt(-4),sqrt(-3)) = Q(i,sqrt(3)). This contains i and is complex at the real places of K, so it cannot be the all-place-unramified ordinary genus field. The prime-discriminant compositum must be assigned to the narrow convention; the ordinary real case needs its separate real subfield comparison. No source README is edited by this job.

Keep the ordinary quotient Cl/Cl^2, the narrow quotient Cl+/Cl+^2, and the actual 2-torsion subgroups distinct. A cardinality equality is not a canonical identification of the groups.

### Pinned-source check already performed

The pins were read from research/blueprint/baseline.json: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Searches were made in both repositories. The pinned Tau Ceti file `TauCeti/NumberTheory/Multiquadratic/Frobenius.lean` (blob `ce7016c958a5abe61372da50c09806db68096244`) was opened in full, including the actual statements and bodies of `NumberField.signPattern_frobenius` and `NumberField.galoisGroupEquiv_frobenius`. The latter assumes a finite index family and square-class independence; both use an odd prime avoiding the radicands. The sign encoding is +1 to 0 and -1 to 1, not reduction of both integer signs modulo 2. The file imports the existing NumberField Frobenius and Multiquadratic Galois Group interfaces. No Lean build or axiom audit is claimed.

### Validation and continuation

The actual scripts/check_links.py and swarm-check.yml have been inspected. The validator requires the full atlas, new-roadmap definitions and other link packets. The PR workflow invokes it for changed link JSON files. A green workflow alone is not a mathematical proof; inspect its validator output. Local full-atlas validation has not run.

Continue with the remaining summary/index and synonym screen, inspect all matching source/consumer stages, resolve ownership overlaps, verify endpoint IDs and literal quotations, then check duplicates and cycles and submit the packet plus the final version of this handoff in a PR. The current claim remains active while this work is performed.
