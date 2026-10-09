# PKG-ComplexMultiplicationAndExplicitReciprocity

Completed by Codex, session `codex-eI8gR5`, for issue #7461. The bot confirmed claim comment 6071340322. This submission completes the package assembly; it does not claim new formalization or closure of the accepted plan's inherited gaps.

## Deliverables

- `research/blueprint/packages/ComplexMultiplicationAndExplicitReciprocity/README.md`: a 133,537-byte roadmap, organized into six mathematical layers CM.0–CM.5 and 21 construction groups. It contains all 69 targets, 75 API entries, 61 named unit-test specifications, acceptance calculations, 37 supplier contracts and 20 sources from the accepted plan. CM.6's exports/examples are placed with the mathematics they exercise rather than presented as a process layer.
- `research/blueprint/packages/ComplexMultiplicationAndExplicitReciprocity/Suggested.lean`: the accepted signatures and examples, with one header/import block and package-relative explanatory comments. A comparison ignoring Lean comments and whitespace confirmed that its code is identical to the accepted suggested file.
- `research/blueprint/packages/ComplexMultiplicationAndExplicitReciprocity/metadata.toml`: `topic = "math.NT"`.

Inputs were the accepted packet, reader and suggested file for this roadmap, its library-coverage audit, and the dependency contracts. The HodgeStructures and ClassFieldTheory upstream READMEs were read in full. No packet, reader, library audit or neighbouring roadmap was changed. All mathematical prose states results in our own words, with source locators; no scholarly passage was copied. No restricted library source was needed.

## Conventions preserved

The package keeps the CM.0 → ShimuraVarieties V4/V5 → CM.2 dependency direction, arithmetic Artin normalization, inverse ideal action, polarization sign and distinct comparison/Galois multipliers, covariant Tate versus cohomological Euler conventions, field-scoped primitive/reflex-type claims, proper invertible ideals for nonmaximal orders, relative reflex discriminants, and geometric versus base-field endomorphisms. Classification includes characteristics 2 and 3. Ring/ray value-field generation requires the stated separation and stabilizer conditions.

The CM.5 order certificate uses all relevant prime powers with the Corollary 4 separation hypotheses, separate 2/3 valuations and independently verified relation counts. CRT reconstruction requires independently certified ordinary full Picard orbits and the strict modulus inequality. Numerical certificates require a complete form census, proved analytic enclosures and integer isolation. These requirements are specifications, not executable implementations.

## Validation

- Final `lean-check research/blueprint/packages/ComplexMultiplicationAndExplicitReciprocity/Suggested.lean`: exit 0, zero errors, 243 warnings, all exactly `declaration uses sorry`. No other Lean warnings. Memory was checked before compilation, with 111 GB available; one compilation was run at a time and both runs finished within the wrapper's 20-minute limit.
- Active imports use Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**, exactly the reference pin. The existing shared build's Tau Ceti checkout is **cf386627e9176a3827c1a5fe804989fd94a4d216**, whereas this package's reference interface is **f790474821cf4256814db967cb154e7af3d0c369**. The two unavailable Tau Ceti imports remain commented, as in the accepted suggested file. Native Tau Ceti declarations were read at the reference commit, but this elaboration does **not** validate their adapters or a build importing those modules. No library build, update, cache download or language server was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ComplexMultiplicationAndExplicitReciprocity.json`: zero errors and zero warnings. This validates the unchanged input, not a new source-closure claim.
- Package checks passed for all target/API/test names, all 37 supplier identifiers, 20 source anchors, internal hyperlinks and reference-style links, the TOML topic, the 200 KB limit, absence of private paths and programme-process language in the README, and code equality with the accepted suggested file.

The admitted example declarations are type checks of proposed statements. They are not executed arithmetic tests or mathematical proofs.

## Inherited boundaries for the independent reviewer

The assembly introduces no additional mathematical gap. These five boundaries remain those of the accepted input:

1. **Absolute versus relative moduli fields.** The relative polarized CM-action stabilizer is specified. The absolute unmarked field in Tsimerman §5, p.386 requires a separate descent/forgetting-action adapter and degree bounds. Full level alone does not kill unpolarized CM units. The README keeps this distinction and the absolute ideal-norm convention explicit.
2. **Canonical Gross existence.** The predicate, conjugation and conductor-support conditions are specified from BKO and Yang. Rohrlich's primary canonical-character/curve existence proof still needs decomposition; exact local conductor exponents need a separate verified calculation. This package has not obtained that missing proof.
3. **Deuring and quaternion integral orders.** The accepted input reads the introduction, realization conclusion and part of the lifting proof, rather than decomposing the complete classification proof. Prime-to-p and p-local maximality and the GN.2 generic quaternion-order interface remain to be established. QFI Layer 2 supplies the rational algebra, not this integral-order API.
4. **Certified algorithm suppliers.** CN.4 must supply an arbitrary-precision j evaluator with proved tails at reduced CM arguments. CN.3 must supply sound counts and a complete finite-field seed/order search. The CM statements condition their soundness and termination on these exact contracts.
5. **Native adapter conditions.** GAP comments in Suggested.lean remain explicit: some binders omit unavailable geometric, realization, modular-function, conductor or algorithm identifications. Their types alone need not imply their conclusions. Complete those adapters against the owning roadmaps before treating the signatures as faithful formal theorem statements.

The source-version cautions concerning Tsimerman, MIT21 ordinary root distinctness, and the prime-only Certify construction in Endo v2 are retained as mathematical scope cautions. They do not assert new errata in uncollated published versions.

## Next step

Independent package review can begin with README §§1–2 and §5, compare the grouped targets with the unchanged accepted input, and repeat `lean-check`. There is no remaining package-assembly work or checkpoint to resume. Adapter/source work above belongs to the inherited contracts, rather than being silently declared solved by assembly.
