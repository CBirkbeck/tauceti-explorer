# Finiteness and characteristic-zero points

This document plans R03.4 of **Commutative algebra for deformation theory and patching**. Its output is the commutative algebra used to turn a finite global deformation ring with a surviving characteristic-zero component into an integral point, and to lift that point through a framing. It also supplies the finiteness arguments used before that point is extracted: finiteness over a complete local coefficient subring, finiteness from a faithful patched module, and the finite-cardinality conclusion in the trace argument.

The packet is a complete planning pass for this one stage. It contains fifteen new declarations and imports the five accepted algebraic point declarations from the P7 packet. The stage is **planned**, with two supplier requests and two recorded gaps. Neither the predecessor nor this document asserts that the mathematics is implemented. The suggested signatures elaborate at the Mathlib pin with admitted proofs; the actual finite-extension topology constructor remains an upstream input.

## Conventions and boundaries

Rings are commutative and homomorphisms preserve one. For a local ring A, write m_A for its maximal ideal and k_A=A/m_A for its residue field. A *local homomorphism* reflects units; between local rings this is equivalent to mapping the source maximal ideal into the target maximal ideal. Module-finite means finitely generated as a module. A finite set means finite cardinality. These two meanings coincide over a finite coefficient ring, but not over a DVR with characteristic-zero fraction field.

O denotes a DVR, π a uniformizer, and K its fraction field. Completeness of O is imposed on the completed finiteness and local-field statements, not on the accepted algebraic point theorem. A is not silently required to be reduced, O-flat or a domain. For example, O[ε]/ε² has nilpotents and still admits the point ε↦0. It is the behavior of π, rather than reducedness of A, that determines whether the generic fibre survives.

The topology assigned to a local ring in a continuity statement is its maximal-ideal adic topology: the ideals m_A^n form a neighborhood basis at zero. For a local-field integer ring there is an additional comparison with its induced topology. The finite extension and that comparison belong to [LocalFieldsRamification Layer 0](../../../content/tau-ceti/LocalFieldsRamification/README.md). Merely supplying an arbitrary topology on the same field is insufficient.

The coefficient categories, small extensions, finite-free completeness, completion foundations and the formally smooth lifting interface belong to R03.1. The representation, Carayol trace generation and framed-to-unframed presentation belong to [GlobalGaloisDeformations](GlobalGaloisDeformations.md). The arithmetic proof of Khare–Wintenberger II Theorem 10.1 belongs to PotentialModularityAndCompatibleSystems R24.1, and its application to representations belongs to R24.2. This packet supplies commutative-algebra inputs to those results. It does not reproduce potential modularity, restriction of Galois representations, Hecke algebras or patching systems.

The integrated node `R03.4/finiteness-of-deformation-rings-criteria` previously combined several assertions. Its stable ID is retained here for the faithful-module finiteness assertion. The residual-fibre and completed criteria, finite-cardinality tail and framing assertions now have separate IDs. The other integrated point ID is already retained by the accepted P7 packet and is imported unchanged.

## The pinned starting point

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed coverage audit describes R03.4 as not built, with partial support for the finiteness criteria. Each of the packet's thirty-nine baseline references was checked by reading its statement and ambient hypotheses at these commits. Searches of the corresponding completion, Noetherian, local-ring and power-series files distinguish complete theorems from ingredients.

Several substantial ingredients already exist. Mathlib has the topological Nakayama surjectivity theorem, separation of finite modules over Noetherian local rings, module finiteness under surjections and injections into Noetherian modules, Noetherianity of Hom modules, the scalar-action algebra map, Artinianity of zero-dimensional Noetherian rings, nilpotence of an Artinian local maximal ideal, and compatible algebra-map lifting into a complete ring. None becomes a new node here.

The completion locality file supplies a local ring structure, the formula for the completed maximal ideal and completeness for that ideal. Its introductory prose also calls the result Noetherian. Its actual declarations do not establish Noetherianity of the completion. The new completed criterion therefore keeps that hypothesis explicit in its native signature and requests the missing foundational theorem from R03.1. The source statement, rather than its introductory prose, determines baseline coverage.

All new declarations are lemmas or theorems on existing carriers. There is no new definition, construction carrier or class, so no new definition API or mandatory definition unit-test list is needed. The reader nevertheless records discrimination tests, and the suggested file includes nine examples on native rings, ideals and power series.

## Finiteness over a complete subring

**`R03.4/residual-fibre-finite-over-complete-subring`.** Let A be local and complete for m_A, and let B be a Noetherian local A-algebra with a local coefficient map. If B/m_A B is finite-dimensional over k_A, then B is finite over A. The map A→B need not be injective, so this includes quotients of a complete coefficient ring. The target B need not be complete.

Choose a finite generating family in B/m_A B and lift its members to B. This gives an A-linear map A^r→B whose composite with the residual quotient is surjective. R03.1 supplies completeness of the finite coordinate module A^r. The local coefficient map gives m_A B⊆m_B. Since B is Noetherian local, its m_B-adic filtration is separated. The native scalar-tower comparison therefore gives separation for the m_A-adic filtration on B, viewed as an A-module. Apply Mathlib's topological Nakayama surjectivity theorem to A^r→B. Its surjectivity makes B finite over A.

This order matters. Separation is obtained from Noetherianity over B itself, where B is already a one-generator module. It is not obtained from the desired conclusion that B is finite over A. Nor does the proof apply ordinary Nakayama to B as an A-module before its finite generation is known.

The hypothesis is finiteness of the entire fibre B/m_A B. It is stronger than finiteness of the residue-field extension k_B/k_A. Taking B=A[[X]] shows the difference: k_B=k_A, but B/m_A B=k_A[[X]] is not finite-dimensional. This example discriminates a correct residual-fibre criterion from a false criterion based only on residue fields. Taking B=A or B=A/I, with I proper, gives positive tests. The quotient example also checks that injection of the coefficient map is unnecessary.

**`R03.4/completed-residual-fibre-criterion`.** For Noetherian local rings A and B, put Â=lim A/m_A^n and B̂=lim B/m_B^n, using the native adic completion carriers. Given a local algebra map Â→B̂, assume B̂ is Noetherian and its fibre B̂/m_Â B̂ is finite-dimensional. Then B̂ is finite over Â, by the preceding theorem and native completeness of Â.

There are two levels of use. The native prototype takes the map of completed rings and its finite fibre explicitly. To start with a local map A→B, R03.1 must supply its extension to completions, with the same scalar tower, and the fibre comparison. When B/m_A B is finite-dimensional over k_A, it is an Artinian local ring. Its maximal ideal is nilpotent; consequently the quotient filtration stabilizes. Exactness and quotient comparison for finite modules identify the completed fibre with that original fibre. This foundational completion argument is requested from its owner rather than rebuilt here.

Completing B does not eliminate a free variable in the residual fibre. For B=A[[X]], the completed fibre still contains X. The criterion neither asserts that every completed local algebra is finite nor obtains a finite fibre from completeness.

**`R03.4/finite-dvr-algebra-iff-finite-special-fibre`.** If O is a complete DVR with finite residue field and A is a Noetherian local O-algebra with a local coefficient map, then

\[
 A\text{ is module-finite over }O
 \quad\Longleftrightarrow\quad
 A/\pi A\text{ has finite cardinality}.
\]

In the forward direction, quotient finiteness descends from A, and the coefficient action factors through the finite field k. In the reverse direction, a finite set is a finite O-module, and the residual-fibre criterion applies. The choice of π is immaterial because every uniformizer generates m_O.

This is the complete-base algebraic step in the characteristic-p to characteristic-zero finiteness argument. No O-flatness follows. O/π² is a valid finite algebra. The same is true of k, which is the crucial counterexample to an unconditional characteristic-zero-point claim.

## Faithful patched modules and the finite-image tail

**`R03.4/finiteness-of-deformation-rings-criteria`.** Let S be Noetherian, R an S-algebra and M an R-module whose S-action is compatible and commutes with the R-action. If M is finite over S and faithful over R, then R is finite over S.

The action gives the native algebra map R→End_S(M). It is injective because equality of the endomorphisms means that the two scalars act equally on every vector; faithfulness reflects that equality. Mathlib already makes End_S(M) Noetherian when M is Noetherian and finite over S. An injective S-linear map into that Noetherian module makes R finite over S.

In Khare–Wintenberger II §9.1 the coefficient ring is S=O[[y₁,…,y_{h+j}]]. The source's argument at printed page 88 is precisely this faithful-action argument. The particular patched module, its faithfulness and the quotient identifications are the patching owner's outputs. Once supplied, specializing the y variables is handled by module finiteness under quotients and compatible scalar restriction. Specializing the first h variables yields a ring finite over the remaining j-variable power series base. Specializing all h+j variables yields the finite unframed ring over O. This does not make the intermediate j-variable ring finite over O.

Faithfulness cannot be replaced by mere existence of a finite module. For R=O[[X]], the module k=R/(π,X) is finite over O, while R is not. The zero module is another test: its action can be faithful only when R is the zero ring. Freeness or flatness of the patched module is not required by this particular finiteness lemma.

Three small declarations make the finite-cardinality end of the trace argument explicit.

**`R03.4/finite-maximal-power-quotients`.** If R is Noetherian local and k_R is finite, then R/m_R^n is a finite set for every n. At n=0 the quotient is the zero ring. The inductive kernel is m_R^n/m_R^(n+1). Noetherianity gives finitely many generators of m_R^n; their images generate that kernel over k_R, because m_R annihilates it. Thus the kernel is finite. A ring with finite ideal and finite quotient is finite, giving the inductive step.

**`R03.4/finite-local-ring-of-dimension-zero`.** If R is also zero-dimensional, Mathlib's Noetherian dimension-zero theorem makes it Artinian. Its maximal ideal is nilpotent, so R equals one of the finite quotients above. Completeness and a coefficient-field embedding are unnecessary. Z/9Z checks that nilpotents are retained. The infinite ring k[[X]] checks that a finite residue field alone is insufficient.

**`R03.4/finite-local-ring-of-finite-prime-quotients`.** If every prime quotient R/q is finite, each is a finite domain and hence a field. All primes are maximal, so R has dimension at most zero. The maximal quotient is finite as well, and the preceding lemma applies.

The early Khare–Wintenberger preprint states the finite-universal-image criterion as Lemma 2.4, on printed page 10; the integrated decomposition cites the later published Lemma 3.6. This pass reads and hashes the early version and records that numbering difference explicitly. Its Galois input is a finite residual field, Mazur's p-finiteness, an absolutely irreducible continuous residual representation and a representable deformation condition. Carayol trace generation and finite-order eigenvalues produce finite prime quotients; the three declarations above supply the remaining commutative algebra. The exact universal deformation and restriction argument stays with the R24.1 theorem and its Galois prerequisites. A general representation with finite image does not force its arbitrary coefficient ring to be finite.

## The accepted algebraic point chain

The accepted P7 packet supplies these five declarations, all with prefix `DeformationAndDerivedPatchingAlgebra:R03.4/`:

1. `nilpotent-uniformizer-artinian`: a finite O-algebra with nilpotent π is Artinian.
2. `generic-prime-coefficient-injection`: a prime q avoiding π_A makes O→A/q injective.
3. `algebraic-point-of-generic-prime`: A/q embeds compatibly into an algebraically closed coefficient extension, producing a map from A with kernel q.
4. `finite-field-of-point-values`: the intermediate field generated by the point's values is finite over K.
5. `characteristic-zero-points-from-finiteness-and-dimension`: positive dimension gives a unit-reflecting integral point in a finite integral closure.

These are dependencies, not fifteen more signatures copied into the new file. The generic prime is chosen from nonnilpotence via the existing nilradical characterization. Its contraction to O is zero: the only nonzero prime of a DVR contains its uniformizer. Quotienting A by that prime gives the domain used for the fraction-field embedding. An arbitrary map of domains is not assumed injective.

The finite-field statement uses the actual `IntermediateField.adjoin` carrier. A finite O-module has finitely many generators. Their point values generate a finite-dimensional K-algebra inside Ω; integral domains integral over a field are fields, so adjoining inverses does not create an infinite-dimensional extension. In characteristic zero the finite extension is separable, and integral closure is finite over the DVR. Locality is obtained using the integral injective domain quotient and then composing with the quotient map. Over an incomplete DVR this is an algebraic unit-reflection statement; it does not independently make the target a complete local ring.

**`R03.4/dimension-one-iff-nonnilpotent-uniformizer`.** For a finite local O-algebra with local coefficient map,

\[
 1\leq\dim A\quad\Longleftrightarrow\quad
 \pi_A\text{ is not nilpotent}.
\]

If π_A is nilpotent, the accepted first lemma makes A Artinian and hence zero-dimensional. Conversely, finite A is Noetherian. If its dimension is below one, it is at most zero, hence Artinian. Its maximal ideal is nilpotent. The local coefficient map puts π_A inside that maximal ideal, so π_A is nilpotent. The locality hypothesis is therefore visible in the prototype and packet.

**`R03.4/characteristic-zero-point-of-nonnilpotent-uniformizer`.** This reformulates the accepted point theorem using the right-hand hypothesis above. The algebraic conclusion is a finite intermediate field E/K and an O-algebra map into integralClosure(O,E) reflecting units. It does not require A to be O-torsion-free. A may have both a generic component and components supported on the special fibre.

Several examples distinguish the hypothesis. A=k and A=O/π² are finite and nonzero, but π_A is nilpotent and no unital characteristic-zero point exists. A=O and A=O[ε]/ε² have surviving π and valid points. A=O[t]/(t(t−π)) has the two points t↦0 and t↦π, indistinguishable after reduction modulo π. The Lean examples test the coefficient obstruction using ZMod 3 and characteristic-zero rationals, and test nilpotence using ℤ and ZMod 9.

## Integer rings and continuity

**`R03.4/local-hom-continuous-for-maximal-adic-topologies`.** A local map f:A→B satisfies f(m_A^n)⊆m_B^n for every n. The native neighborhood bases give continuity at zero, and additivity translates it to all points. This statement needs neither Noetherianity nor completeness. It does require the indicated topologies.

**`R03.4/integer-ring-point-with-topology`.** For a characteristic-zero nonarchimedean local field K and O=𝒪[K], the accepted algebraic point can be transported to a local continuous map A→𝒪[E] for a finite E/K. LocalFieldsRamification owns the induced valuation and topology on the actual finite intermediate field E, its completeness, its integer-ring algebra structure, the integral-closure comparison and the equality of the induced integer topology with its maximal-adic topology. Compose with that genuine algebra equivalence and apply the preceding continuity lemma.

The suggested file states the transport adapter using an actual O-algebra equivalence integralClosure(O,E)≃S. That adapter is a useful elaborated boundary, but it is weaker than constructing the particular S=𝒪[E]. The latter signature awaits the owner structures. No placeholder proposition stands for the extension topology, and no construction records the desired point as a field of its own input.

The residue field of the target must be allowed to grow. Consider A=Z₃[t]/(t²−18). It is finite and local: its special fibre is F₃[t]/t². In any characteristic-zero point, u=t/3 satisfies u²=2. In the integral target u is an integral unit, so its residue has square 2. There is no such element in F₃. A compatible extension of the residue field is therefore essential, even though the starting algebra has residue field F₃. The suggested example states this obstruction on ZMod 3; the division and integral-unit argument belongs to the mathematical acceptance check, not to that small residue example alone.

## Framed lifting

**`R03.4/compatible-artinian-limit-is-local`.** Mathlib already lifts a compatible family of algebra maps B→E/m_E^n into a complete local target E, and identifies every reduction of the lift. The additional lemma says that the lift reflects units if the level-1 map does. Its composite with E→E/m_E is the given local map, so the existing composite-locality criterion applies. Level zero carries no such information: E/m_E^0 is the zero ring.

**`R03.4/framed-point-from-artinian-lifting`.** Let A→B be formally smooth in the declared complete-local coefficient category and let A→O′ be an integral point. After the required residue change, choose a local residue point B→O′/m′ compatible with it. The owner lifting interface supplies a local successor lift at every quotient O′/m′^(n+1)→O′/m′^n. For n≥1 the kernel is square-zero, and for a DVR it is one-dimensional over the target residue field.

Choose the lifts recursively, retaining the previous map at each step. Then all transition equalities follow by composition. Add the unique level-zero map and apply Mathlib's complete-target algebra-map lift. Locality follows from its first reduction, and continuity follows from the maximal-adic lemma. Its A-algebra structure expresses that it extends the original point.

Separately existing lifts at each level are not enough: they must form one compatible family. Formal smoothness also requires the correct coefficient category, the initial residue point and base change to the target residue field. The signature exposes concrete algebra maps, their localness and their canonical reductions in a successor-lifting quantifier. R03.1 is responsible for deriving that quantifier from coefficient-category smoothness. This use does not replace that category by an arbitrary algebraic smoothness predicate.

**`R03.4/framed-point-from-power-series-presentation`.** If the framing is given by an actual A-algebra equivalence B≃A[[X₁,…,X_d]], compose it with constant-coefficient evaluation and the base point A→E. The native power-series unit criterion proves locality, and the preceding continuity result applies. No convergence theorem is needed when every variable is sent to zero. For d=0 this is just the base point. The presentation itself is the Galois deformation owner's output.

**`R03.4/positive-framing-is-not-module-finite`.** If A is a nontrivial O-algebra and d>0, A[[X₁,…,X_d]] is not finite over O. If it were finite, X₁ would satisfy a monic polynomial over O. Extract its coefficient in the direction of X₁ at the polynomial degree: the leading term contributes 1_A, while all lower terms contribute zero. This contradicts the evaluated relation. This proof needs neither a Krull dimension formula nor Noetherianity.

Thus framing preserves the ability to obtain points through a presentation or lifting argument, but a positive number of framing variables prevents O-module finiteness. The special cases d=0 and A=0 must be excluded from the nonfiniteness assertion. These checks also distinguish a finite unframed ring from its framed power series enlargement in the patching specialization argument.

## Supplier obligations, prototypes and review

The first request, to R03.1, has two concrete parts. The completion part supplies finite-coordinate-module completeness, Noetherianity of Noetherian local completions, continuous extension of local maps and the finite residual-fibre comparison. The lifting part supplies local smooth lifts after compatible residue-field extension. The second request, to LocalFieldsRamification Layer 0, supplies the actual finite intermediate-field structures and the integral-closure/topology comparison. Both requests name their consuming nodes. The inherited algebraic point theorem is not made dependent on topology.

The suggested file has fourteen direct signatures, one integer-ring transport adapter and nine examples. All proofs are admitted, as required for blueprint signatures. The whole file elaborated through `lean-check` using the existing build at the Mathlib pin, with exit code zero and only admitted-proof warnings. This checks typing of the native rings, quotient transitions, scalar towers, intermediate fields and example statements. It proves no mathematical assertion and does not validate a Tau Ceti finite-extension implementation.

The packet adds four planets: **Finite residual-fibre criterion**, **Finite special-fibre criterion**, **Faithful-module finiteness**, and **Framed point lifting**. It retains the predecessor's **Characteristic-zero points** planet by reference, giving five displays for the assembled stage. Each names a theorem rather than a source locator; the nonnilpotent reformulation adds no duplicate point planet.

Sources are the author-final [Khare–Wintenberger II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), its specified printed sections, the explicitly identified [early finite-image preprint](https://arxiv.org/pdf/math/0412076), the accepted [local-fields roadmap](../../../content/tau-ceti/LocalFieldsRamification/README.md), and the pinned source files listed individually in the packet. The packet hashes the two PDFs and every cited Mathlib file. No new published-source error is asserted; the numbering difference and completion-header distinction are recorded with their exact scope.
